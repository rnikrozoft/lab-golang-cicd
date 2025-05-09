FROM golang:1.24-alpine as stage
WORKDIR /app
COPY . .
RUN go build -o /main main.go

FROM alpine
WORKDIR /
COPY --from=stage /main /main

EXPOSE 80

ENTRYPOINT [ "/main" ]