FROM gcc:latest AS builder
WORKDIR /app
COPY . .
RUN g++ test.cpp -o test
FROM gcc:latest
WORKDIR /app
COPY --from=builder /app/test /app/
COPY . .
CMD ["./test"]