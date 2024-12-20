FROM gcc:latest
WORKDIR /app
COPY . .

RUN g++ test.cpp -o test

CMD ["./test"]