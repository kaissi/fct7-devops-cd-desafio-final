#!/bin/bash

CONTAINER_ID=$(
    docker run --detach \
        --tty \
        --interactive \
        --name ${DOCKER_NAME} \
        --publish ${DOCKER_PORT}:${DOCKER_PORT} \
        ${DOCKER_IMAGE}:${DOCKER_TAG}
)

if [ $? = 0 ]; then
    echo "Container '${DOCKER_NAME}' running"
fi