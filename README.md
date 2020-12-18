# powervs-container-host

Builds multi-arch containers from where you can run Terraform automation to install OpenShit at IBM Cloud on PowerVS.

# Pulling Images

The images are located at https://quay.io/repository/powercloud/powervs-container-host.

```
docker or podman pull quay.io/powercloud/powervs-container-host:latest

docker or podman pull quay.io/powercloud/powervs-container-host:ocp-4.5

docker or podman pull quay.io/powercloud/powervs-container-host:ocp-4.6
```

# Building the images

```
  cd ./dockerfiles

  (x86_64)  docker build -t powervs-container-host-$(uname -m) -f ./Dockerfile.x86_64 .

  (ppc64le) docker build -t powervs-container-host-$(uname -m) -f ./Dockerfile.ppc64le .
```
