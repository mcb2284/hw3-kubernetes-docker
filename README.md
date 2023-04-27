# hw3-kubernetes-docker

## Docker

Ensure the docker **mongo** image is installed:

    brew install mongo

### Run
Start the container:
    
    docker-compose up

Stop the container:

    docker-compose down


## Make
The **Makefile** contains all the docker commands.

### Build the Docker image
    make build

### Start the Docker containers
    make start

### Stop the Docker containers
    make stop

### Restart the Docker containers
    make restart

### Clean up Docker containers and images
    make clean

### View the Docker logs
    make logs


## Minikube

Start the minikube with `minikube start`

Add the deployment file `kubectl apply -f deployment.yaml`

Add the service file `kubectl apply -f service.yaml`

View running deployments   `kubectl get deployments`

View running pods   `kubectl get pods`

View running services   `kubectl get services`

Delete all:
    
    kubectl delete deployments --all
    kubectl delete services --all
    
