FROM golang:1.24 AS builder
WORKDIR /app
COPY . .
RUN go build -o main

FROM alpine
WORKDIR /app
COPY --from=builder /app/main .
EXPOSE 80
CMD ["./main"]
