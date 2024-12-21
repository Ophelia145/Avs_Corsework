FROM gcc:latest

COPY test.cpp /app/test.cpp

WORKDIR /app
CMD ["g++","test.cpp", "-o", "test"]