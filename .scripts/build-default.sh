#!/bin/bash

echo "Building to local architecture (default)"

docker build \
    -t ${DOCKER_IMAGE}:${DOCKER_TAG} \
    -f .docker/Dockerfile \
    .