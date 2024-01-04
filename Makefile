HOST_WORKSPACE=${PWD}/
CONTAINER_WORKSPACE=/data
ORG=localgod
APP=docker-sonarqube-scanner
VERSION=latest
IMAGE=${ORG}/${APP}:${VERSION}

.PHONY: login logout build push pull run console

build:
	@docker build \
	--build-arg BUILD_DATE=$(shell date -u +'%Y-%m-%dT%H:%M:%SZ') \
	--build-arg VCS_REF=$(shell git rev-parse HEAD) \
	--build-arg VERSION=$(shell cat VERSION) \
	-t ${IMAGE} .

run:
	docker run \
	--rm \
	--user $(shell id -u):$(shell id -g) \
	-w ${CONTAINER_WORKSPACE} \
	-v ${HOST_WORKSPACE}:${CONTAINER_WORKSPACE} ${IMAGE}

console:
	docker run \
	--rm \
	--user $(shell id -u):$(shell id -g) \
	-w ${CONTAINER_WORKSPACE} \
	-v ${HOST_WORKSPACE}:${CONTAINER_WORKSPACE} \
	-it --entrypoint=/bin/sh ${IMAGE}
