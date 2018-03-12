PROJECT := nodejs
PROJECT_TEST := $(PROJECT).test
DOCKER_IMAGE := $(PROJECT)
BUILD := $$TRAVIS_BUILD_NUMBER
VERSION=$$(node -p -e "require('./package.json').version")




# runners
# ##################################################################################################

dev:
	npm run start:dev




# test
# ##################################################################################################

test:
	npm run test:all

test-docker:
	docker rm -f $(PROJECT_TEST) || true && \
	docker build -t $(PROJECT_TEST) -f Dockerfile.test . && \
	docker run --rm -v $$(pwd):/app --name $(PROJECT_TEST) -t $(PROJECT_TEST) && \
	echo Coverage Report && \
	echo file://$$(pwd)/reports/coverage/lcov-report/index.html




# docker
# ##################################################################################################

docker: docker-build docker-push docker-cleanup

docker-build:
	docker build -t $(DOCKER_IMAGE):$(BUILD) . && \
	docker tag $(DOCKER_IMAGE):$(BUILD) $(DOCKER_IMAGE):latest && \
	docker tag $(DOCKER_IMAGE):$(BUILD) $(DOCKER_IMAGE):$(VERSION)

docker-push:
	docker login -u ${DOCKER_USER} -p ${DOCKER_PASSWORD} && \
	docker push $(DOCKER_IMAGE):latest && \
	docker push $(DOCKER_IMAGE):$(VERSION)

docker-cleanup:
	docker rmi -f $(DOCKER_IMAGE):$(VERSION) || true && \
	docker rmi -f $(DOCKER_IMAGE):latest || true




.PHONY: dev
