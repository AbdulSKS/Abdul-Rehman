FROM golang:1.16

WORKDIR /app

COPY . .

RUN chmod 777 *

RUN go build -o main .

EXPOSE 8000

CMD ["./main"]
