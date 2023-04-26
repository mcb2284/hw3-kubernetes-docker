# Docker image name and version
IMAGE_NAME = my-todo-app
IMAGE_VERSION = 1.0

# Docker container name
CONTAINER_NAME = my-todo-app-container

# Build the Docker image
build:
	docker build -t $(IMAGE_NAME):$(IMAGE_VERSION) .

# Run the Docker container
run:
	docker run -d -p 8000:8000 --name $(CONTAINER_NAME) $(IMAGE_NAME):$(IMAGE_VERSION)

# Stop the Docker container
stop:
	docker stop $(CONTAINER_NAME)

# Remove the Docker container
remove:
	docker rm $(CONTAINER_NAME)

# Clean up the Docker image
clean:
	docker rmi $(IMAGE_NAME):$(IMAGE_VERSION)

# Build and run the Docker container
start: build run

# Stop and remove the Docker container
stop-and-remove: stop remove
