# Stage 1: Build the application
FROM clojure:lein-2.9.1 as builder

# Copy the project files into the container
WORKDIR /usr/src/app
COPY . /usr/src/app

# Run Leiningen to build the standalone jar
# This assumes you have a 'uberjar' profile set up in your project.clj
RUN lein uberjar

# Stage 2: Create the final Docker image
FROM openjdk:8-jre-alpine

# Copy the standalone jar from the builder stage
WORKDIR /usr/app
COPY --from=builder /usr/src/app/target/uberjar/web-simple-0.1.0-SNAPSHOT-standalone.jar /usr/app/

# Command to run the application
CMD ["java", "-jar", "web-simple-0.1.0-SNAPSHOT-standalone.jar"]
