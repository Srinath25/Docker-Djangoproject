FROM ubuntu

WORKDIR /app

COPY requirements.txt .

RUN apt-get update && \
    apt-get install -y python3 python3-pip && \
    pip install --no-cache-dir -r requirements.txt

COPY myweb .

WORKDIR /app/myweb

ENTRYPOINT ["python3", "manage.py"]
CMD ["runserver", "0.0.0.0:8000"]