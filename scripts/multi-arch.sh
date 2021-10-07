#!/usr/bin/env bash

export DOCKER_CLI_EXPERIMENTAL=enabled

docker manifest create quay.io/powercloud/powervs-container-host:multi-arch \
quay.io/powercloud/powervs-container-host:x86_64 quay.io/powercloud/powervs-container-host:ppc64le

docker manifest inspect quay.io/powercloud/powervs-container-host:multi-arch
docker login quay.io -u "$USER_QUAY" -p "$PWD_QUAY"
docker manifest push quay.io/powercloud/powervs-container-host:multi-arch