HOST_WORKSPACE=${PWD}/
CONTAINER_WORKSPACE=/data
VERSION=3.0.3.778
IMAGE=localgod/docker-sonarqube-scanner:${VERSION}

.PHONY: login logout build push pull run console

login:
	@docker login -u ${REGISTRY_USER} -p ${REGISTRY_PASS}

logout:
	@docker logout ${REGISTRY}

build:
	docker build -t="${IMAGE}" .

push:
	docker push ${IMAGE}

pull:
	docker pull ${IMAGE}

run:
	docker run --rm --user $(shell id -u):$(shell id -g) -w ${CONTAINER_WORKSPACE} -v ${HOST_WORKSPACE}:${CONTAINER_WORKSPACE} ${IMAGE}

console:
	docker run --rm --user $(shell id -u):$(shell id -g) -w ${CONTAINER_WORKSPACE} -v ${HOST_WORKSPACE}:${CONTAINER_WORKSPACE} -it --entrypoint=/bin/sh ${IMAGE}

version:
	@sed -i -e "s/^VERSION\=.*/VERSION=${VERSION}/" Makefile
	@sed -i -e "s/^ENV\sVERSION.*/ENV VERSION ${VERSION}/" Dockerfile
