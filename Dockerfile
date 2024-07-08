# Use the official Maven image to build the application
FROM maven:3.8.1-openjdk-8 AS build

# Set the working directory in the container
WORKDIR /app

# Copy the pom.xml file and the source code to the container
COPY pom.xml .
COPY src ./src

# Build the application
RUN mvn clean package

# Use the official OpenJDK image to run the application
FROM openjdk:8-jre

# Set the working directory in the container
WORKDIR /app

# Copy the built jar file from the Maven build stage
COPY --from=build /app/target/jb-hello-world-maven-0.2.0.jar ./jb-hello-world-maven-0.2.0.jar

# Specify the entrypoint command to run the application
ENTRYPOINT ["java", "-cp", "jb-hello-world-maven-0.2.0.jar", "hello.HelloWorld"]

EXPOSE 8080
