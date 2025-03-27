FROM ubuntu:latest
WORKDIR /app
COPY . .
CMD ["echo", "Hello from Docker"]
