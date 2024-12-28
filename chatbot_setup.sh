#!/bin/bash

# Variables
DOCKER_COMPOSE="docker-compose"
MVN="mvn"
APP_NAME="chatbot-be"
VERSION="1.0.0"

# Function to display help
show_help() {
    echo "Available commands:"
    echo "  ./script.sh all          - Build and run application in Docker"
    echo "  ./script.sh clean        - Clean all artifacts"
    echo "  ./script.sh build        - Build Java application"
    echo "  ./script.sh docker-build - Build Docker images (includes Java build)"
    echo "  ./script.sh docker-run   - Run Docker containers"
    echo "  ./script.sh docker-stop  - Stop containers"
    echo "  ./script.sh docker-clean - Remove all Docker resources"
    echo "  ./script.sh test         - Run tests"
    echo "  ./script.sh logs         - Show container logs"
    echo "  ./script.sh status       - Check container status"
}

# Clean build artifacts
clean() {
    echo "Cleaning project..."
    $MVN clean
    $DOCKER_COMPOSE down -v
    rm -rf target/
}

# Build and package Java application
build() {
    echo "Building Java application..."
    $MVN clean install -DskipTests
}

# Build Docker images with Java build included
docker_build() {
    echo "Building Docker images..."
    $MVN clean install -DskipTests
    $DOCKER_COMPOSE build --no-cache
}

# Run Docker containers
docker_run() {
    echo "Starting Docker containers..."
    $DOCKER_COMPOSE up -d
    echo "Services available at:"
    echo "- Application: http://localhost:8080"
    echo "- Swagger UI: http://localhost:8080/swagger-ui.html"
    echo "- Mongo Express: http://localhost:8081"
}

# Stop Docker containers
docker_stop() {
    echo "Stopping Docker containers..."
    $DOCKER_COMPOSE down
}

# Remove Docker containers and volumes
docker_clean() {
    echo "Cleaning Docker resources..."
    $DOCKER_COMPOSE down -v --rmi all
}

# Show logs
show_logs() {
    $DOCKER_COMPOSE logs -f
}

# Show status
show_status() {
    $DOCKER_COMPOSE ps
}

# Run tests
run_tests() {
    $MVN test
}

# Main case statement to handle commands
case "$1" in
    "all")
        docker_build
        docker_run
        ;;
    "clean")
        clean
        ;;
    "build")
        build
        ;;
    "docker-build")
        docker_build
        ;;
    "docker-run")
        docker_run
        ;;
    "docker-stop")
        docker_stop
        ;;
    "docker-clean")
        docker_clean
        ;;
    "test")
        run_tests
        ;;
    "logs")
        show_logs
        ;;
    "status")
        show_status
        ;;
    "help"|"")
        show_help
        ;;
    *)
        echo "Unknown command: $1"
        show_help
        exit 1
        ;;
esac