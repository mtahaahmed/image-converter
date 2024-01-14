# app.py
from flask import Flask, request, jsonify
from google.cloud import pubsub_v1
from google.cloud import storage
import mysql.connector 
import os
import json
import tempfile
from PIL import Image
import io

app = Flask(__name__)

# Set GCP environment variables
os.environ["GOOGLE_APPLICATION_CREDENTIALS"] = "/mnt/key.json"
os.environ["GOOGLE_CLOUD_PROJECT"]
os.environ["CLOUD_STORAGE_BUCKET"]
os.environ["CLOUD_SQL_INSTANCE"]
os.environ["PUBSUB_TOPIC"]
os.environ["DB_USER"]
os.environ["DB_PASSWORD"]
os.environ["DB_NAME"]

# Initialize GCP clients
storage_client = storage.Client()
pubsub_publisher = pubsub_v1.PublisherClient()

@app.route('/process', methods=['POST'])
def process_image():
    data = request.get_json()
    url = data.get('url')
    name = data.get('name')

    # Store job as pending in GCP Cloud SQL
    connection_name = os.environ["CLOUD_SQL_INSTANCE"]
    db_user = os.environ["DB_USER"]
    db_password = os.environ["DB_PASSWORD"]
    db_name = os.environ["DB_NAME"]
    db = mysql.connector.connect(
        host=connection_name,
        user=db_user,
        password=db_password,
        database=db_name
    )
    cursor = db.cursor()
    cursor.execute("INSERT INTO pending_jobs (name, url) VALUES (%s, %s)", (name, url))
    db.commit()
    db.close()

    # Raise a Pub/Sub event
    topic_path = f"projects/{os.environ['GOOGLE_CLOUD_PROJECT']}/topics/{os.environ['PUBSUB_TOPIC']}"
    pubsub_publisher.publish(topic_path, data=json.dumps({'name': name, 'url': url}).encode('utf-8'))

    # Include the processed image URL in the response
    processed_url = convert_and_store_image(url, name)
    return jsonify({'message': 'Image processing job initiated', 'processed_url': processed_url}), 200

@app.route('/pending', methods=['GET'])
def get_pending_images():
    # Fetch pending images from GCP Cloud SQL
    connection_name = os.environ["CLOUD_SQL_INSTANCE"]
    db_user = os.environ["DB_USER"]
    db_password = os.environ["DB_PASSWORD"]
    db_name = os.environ["DB_NAME"]
    db = mysql.connector.connect(
        host=connection_name,
        user=db_user,
        password=db_password,
        database=db_name
    )
    cursor = db.cursor()
    cursor.execute("SELECT name, url FROM pending_jobs")
    pending_data = [{'name': name, 'url': url} for name, url in cursor.fetchall()]
    db.close()

    return jsonify({'pending': pending_data}), 200

@app.route('/processed', methods=['GET'])
def get_processed_images():
    # Fetch processed images from GCP Cloud SQL
    connection_name = os.environ["CLOUD_SQL_INSTANCE"]
    db_user = os.environ["DB_USER"]
    db_password = os.environ["DB_PASSWORD"]
    db_name = os.environ["DB_NAME"]
    db = mysql.connector.connect(
        host=connection_name,
        user=db_user,
        password=db_password,
        database=db_name
    )
    cursor = db.cursor()
    cursor.execute("SELECT name, url FROM processed_jobs")
    processed_data = [{'name': name, 'url': url} for name, url in cursor.fetchall()]
    db.close()

    return jsonify({'processed': processed_data}), 200

@app.route('/', methods=['GET'])
def health():
    print("health endpoint")
    return '', 200

def convert_and_store_image(input_url, name):
    # Download the image to memory
    image_content = storage_client.bucket(os.environ['CLOUD_STORAGE_BUCKET']).blob(input_url).download_as_bytes()

    # Convert the image to WebP format
    with tempfile.NamedTemporaryFile(suffix=".webp", delete=False) as temp_file:
        temp_filename = temp_file.name
        with Image.open(io.BytesIO(image_content)) as img:
            img.save(temp_filename, format="WEBP")

    # Store the converted image in GCP Cloud Storage
    output_url = f"processed/{name}.webp"
    storage_client.bucket(os.environ['CLOUD_STORAGE_BUCKET']).blob(output_url).upload_from_filename(temp_filename)

    # Update the Cloud SQL database with the resulting URL
    connection_name = os.environ["CLOUD_SQL_INSTANCE"]
    db_user = os.environ["DB_USER"]
    db_password = os.environ["DB_PASSWORD"]
    db_name = os.environ["DB_NAME"]
    db = mysql.connector.connect(
        host=connection_name,
        user=db_user,
        password=db_password,
        database=db_name
    )
    cursor = db.cursor()
    cursor.execute("INSERT INTO processed_jobs (name, url) VALUES (%s, %s)", (name, output_url))
    db.commit()
    db.close()

    return f"https://storage.googleapis.com/{os.environ['CLOUD_STORAGE_BUCKET']}/{output_url}"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
