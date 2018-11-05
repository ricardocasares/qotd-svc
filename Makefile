NAME := ${TRAVIS_REPO_SLUG}
TAG := ${TRAVIS_COMMIT}
IMG := ${NAME}:${TAG}
LATEST := ${NAME}:latest

.PHONY: build push tag login

help:
	@echo ""
	@echo "usage: make COMMAND"
	@echo ""
	@echo "Commands:"
	@echo "  build		Build the docker image"
	@echo "  tag			Tag the image as latest"
	@echo "  push			Push to the docker registry"
	@echo "  login		Login to the docker registry"

build:
	@docker build -t ${IMG} .

push:
	@docker push ${NAME}

tag:
	@docker tag ${IMG} ${LATEST}

login:
	@docker login -u ${DOCKER_USER} -p ${DOCKER_PASS}