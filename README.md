# powervs-container-host

Builds multi-arch containers from where you can run Terraform automation to install OpenShit at IBM Cloud on PowerVS.

# Building the images

```
  cd ./dockerfiles

  (x86_64)  docker build -t powervs-container-host-$(uname -m) -f ./Dockerfile.x86_64 .

  (ppc64le) docker build -t powervs-container-host-$(uname -m) -f ./Dockerfile.ppc64le .
```
