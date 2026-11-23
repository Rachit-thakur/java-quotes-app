# Stage 1: Build the application using the full JDK
FROM eclipse-temurin:17-jdk-alpine AS builder

WORKDIR /build

# Copy source code and compile it
COPY src/Main.java .
RUN javac Main.java

# Stage 2: Create the lightweight runtime image
FROM eclipse-temurin:17-jre-alpine

WORKDIR /app

# Copy the compiled class file from the builder stage
COPY --from=builder /build/Main.class /app/Main.class

# Copy static assets directly to the runtime stage
COPY quotes.txt /app/quotes.txt

EXPOSE 8000

CMD ["java", "Main"]

