.PHONY: build test push push-image

IMAGE_NAME ?= alertmanager-webhook-logger
IMAGE_PREFIX ?= grafana
IMAGE_TAG ?= 0.3

build:
	docker build -t $(IMAGE_PREFIX)/${IMAGE_NAME} .
	docker tag $(IMAGE_PREFIX)/${IMAGE_NAME} $(IMAGE_PREFIX)/${IMAGE_NAME}:$(IMAGE_TAG) 

test: build

push: build test push-image

push-image:
	docker push $(IMAGE_PREFIX)/${IMAGE_NAME}:$(IMAGE_TAG)
	docker push $(IMAGE_PREFIX)/${IMAGE_NAME}:latest
