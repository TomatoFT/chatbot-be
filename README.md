# Chatbot Backend Service

## Tech Stack
- Java 17
- Spring Boot 3.1.5
- MongoDB
- Docker & Docker Compose
- Swagger UI

## Prerequisites
- Java 17+
- Docker & Docker Compose
- Maven 3.x
- Make (optional)

## Quick Start
```bash
# Build and run with Docker
make all

# Or manually
mvn clean install
docker-compose up
```

### Services
- Application: http://localhost:8080
- Swagger UI: http://localhost:8080/swagger-ui.html
- Mongo Express: http://localhost:8081

## Development
### Project Structure
```
chatbot-be/
├── src/main/java/com/example/demo/
│   ├── config/         # Configuration classes
│   ├── controller/     # REST controllers
│   ├── entity/         # Domain models
│   ├── repository/     # Database repositories
│   └── service/        # Business logic
└── src/main/resources/ # Application properties
```

###  MongoDB Configuration
- Host: mongodb
- Port: 27017
- Database: chatbotdb
- Username: chatbotuser
- Admin UI: http://localhost:8081

### API Endpoints
- POST `/auth/register` - Register user
- POST `/auth/login` - Authenticate user


