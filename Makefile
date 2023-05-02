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

deploy:
	kubectl apply -f deployment.yaml
	kubectl apply -f service.yaml
	kubectl apply -f mongo.yaml
	kubectl apply -f replication-controller.yaml
delete:
	kubectl delete deployments --all
	kubectl delete services --all
	kubectl delete rc flask-rc

##### Helpful kubectl commands:
# kubectl cluster-info dump
# kubectl apply -f .
# kubectl describe pod <podname>
# kubectl get pods --watch 

##### Fixing minikube by updating the image that's pushed to docker hub (do not use outdated):
#
# login to my docker if its easier: 
# docker login --username=isabelmacgill --email=ism2113@columbia.edu
# password: pa1416DTLA1618!
#
# https://jsta.github.io/r-docker-tutorial/04-Dockerhub.html
#
# docker images 
# run ^ to get image id of newly updated/created image
# 
# docker tag <imageId> <isabelmacgill>/<repositoryname>:<tag>
# run ^ to tage the image you want to push
# 
# docker push <isabelmacgill>/<repositoryname>
# run ^ to push to docker hub
#
# in deployment.yaml where you specify container image name: 
# image: <yourhubusername>/<respositoryname>:<tag>
# make delete, make clean, minikube service flask 


## Probes + Rolling Update Strategies: 
# https://www.bluematador.com/blog/kubernetes-deployments-rolling-update-configuration


## Fixing minikube service error by not pulling images BAD JUST TO TEST:
# https://medium.com/swlh/how-to-run-locally-built-docker-images-in-kubernetes-b28fbc32cc1d
#
# add image never pull policy line to deployment.yaml (flask file)
# check minikube docker-env, run: 
# minikube docker-env
#
# point minikube daemon to local docker (docker-daemon), run: 
# eval $(minikube -p minikube docker-env)
