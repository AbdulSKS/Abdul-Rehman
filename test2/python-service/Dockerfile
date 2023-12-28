FROM python:3.8

WORKDIR /app

COPY . .

RUN pip install --no-cache-dir -r requirements-prod.txt

COPY . .

EXPOSE 5000

CMD ["python3","-m","flask","run","--host=0.0.0.0"]
