FROM ubuntu

WORKDIR /app

COPY requirements.txt /app
COPY myweb /app

RUN apt-get update && \
    apt-get install -y python3 python3-pip && \
    pip install --no-cache-dir -r requirements.txt && \
    cd myweb

COPY myweb .

ENTRYPOINT ["python3", "manage.py"]
CMD ["runserver", "0.0.0.0:8000"]