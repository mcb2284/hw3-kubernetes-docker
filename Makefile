# Makefile for Docker Compose

# Define variables
COMPOSE_FILE = docker-compose.yml
IMAGE_NAME = hw3-kubernetes-docker-flask

# Build the Docker image
build:
	docker-compose -f $(COMPOSE_FILE) build

# Start the Docker containers
start:
	docker-compose -f $(COMPOSE_FILE) up -d

# Stop the Docker containers
stop:
	docker-compose -f $(COMPOSE_FILE) down

# Restart the Docker containers
restart: stop start

# Clean up Docker containers and images
clean:
	docker-compose -f $(COMPOSE_FILE) down
	docker rmi -f $(IMAGE_NAME)

# View the Docker logs
logs:
	docker-compose -f $(COMPOSE_FILE) logs -f

# Enter the Flask container
shell:
	docker-compose -f $(COMPOSE_FILE) exec flask bash

