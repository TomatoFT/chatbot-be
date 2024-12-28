# Use OpenJDK 17 as the base image
FROM eclipse-temurin:17-jdk-focal

# Set working directory
WORKDIR /app

# Copy the JAR file
COPY target/chatbot-be-1.0.0.jar app.jar

# Expose ports for both Spring Boot and MongoDB
EXPOSE 8080
EXPOSE 27017

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]