FROM alpine:latest
COPY hello.txt /app/hello.txt
CMD ["cat", "/app/hello.txt"]
