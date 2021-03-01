#!/usr/bin/env bash

export DOCKER_CLI_EXPERIMENTAL=enabled

OCP_VERSION=4.7

docker manifest create quay.io/powercloud/powervs-container-host:ocp-$OCP_VERSION \
quay.io/powercloud/powervs-container-host:container-host-$OCP_VERSION-x86_64 \ quay.io/powercloud/powervs-container-host:container-host-$OCP_VERSION-ppc64le

docker manifest inspect quay.io/powercloud/powervs-container-host:ocp-$OCP_VERSION

docker login quay.io -u $USER_QUAY -p $PWD_QUAY

docker manifest push quay.io/powercloud/powervs-container-host:ocp-$OCP_VERSION