#!/bin/bash

echo "Pushing all Docker images"

docker push ${DOCKER_IMAGE}:${DOCKER_TAG}-amd64
docker push ${DOCKER_IMAGE}:${DOCKER_TAG}-arm64
docker push ${DOCKER_IMAGE}:${DOCKER_TAG}-armv7
docker push ${DOCKER_IMAGE}:${DOCKER_TAG}-armhf

echo "Creating manifest of '${DOCKER_IMAGE}:${DOCKER_TAG}'"

docker manifest create --amend ${DOCKER_IMAGE}:${DOCKER_TAG} \
    ${DOCKER_IMAGE}:${DOCKER_TAG}-amd64 \
    ${DOCKER_IMAGE}:${DOCKER_TAG}-arm64 \
    ${DOCKER_IMAGE}:${DOCKER_TAG}-armv7 \
    ${DOCKER_IMAGE}:${DOCKER_TAG}-armhf \

docker manifest annotate \
    ${DOCKER_IMAGE}:${DOCKER_TAG} \
    ${DOCKER_IMAGE}:${DOCKER_TAG}-amd64 \
    --arch amd64 \
    --os linux

docker manifest annotate \
    ${DOCKER_IMAGE}:${DOCKER_TAG} \
    ${DOCKER_IMAGE}:${DOCKER_TAG}-arm64 \
    --arch arm64 \
    --variant v8 \
    --os linux

docker manifest annotate \
    ${DOCKER_IMAGE}:${DOCKER_TAG} \
    ${DOCKER_IMAGE}:${DOCKER_TAG}-armv7 \
    --arch arm \
    --variant v7 \
    --os linux

docker manifest annotate ${DOCKER_IMAGE}:${DOCKER_TAG} \
    ${DOCKER_IMAGE}:${DOCKER_TAG}-armhf \
    --arch arm \
    --variant v6 \
    --os linux

echo "Pushing the manifest"

docker manifest push --purge ${DOCKER_IMAGE}:${DOCKER_TAG}