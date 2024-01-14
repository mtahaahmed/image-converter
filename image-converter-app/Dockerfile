## docker build -t tahakarachi/image-converter:latest -t tahakarachi/image-converter:v1.0 .


## For Pushing docker image
### docker push tahakarachi/image-converter --all-tags
ARG ARCH=amd64
FROM python:3.10

WORKDIR /app

COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

COPY . /app/

EXPOSE 5000

CMD ["python", "app.py"]
