# Stage 1: Build the application using Maven
FROM maven:3.9.4-amazoncorretto-17 AS build

# Set the working directory
WORKDIR /app

# Copy the Maven project files
COPY pom.xml .
COPY src ./src

# Run Maven to build the application
RUN mvn clean package -DskipTests

# Stage 2: Run the application using Amazon Corretto
FROM amazoncorretto:17

# Set the working directory
WORKDIR /app

# Copy the built JAR file from the build stage
COPY --from=build /app/target/*.jar app.jar

# Expose the application port
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
