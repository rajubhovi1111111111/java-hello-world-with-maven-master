# Use an official OpenJDK runtime as the base image for running the application
FROM eclipse-temurin:17-jdk-alpine

# Set the working directory in the container
WORKDIR /app

# Copy the jar file from the build stage
COPY  target/jb-hello-world-maven-0.2.0.jar jb-hello-world-maven-0.2.0.jar

# Expose the port the application runs on
EXPOSE 8080

# Run the jar file
ENTRYPOINT ["sh", "-c", "java -jar jb-hello-world-maven-0.2.0.jar && sleep infinity"]
