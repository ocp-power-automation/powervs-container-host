#!/bin/bash

microdnf update
microdnf install -y git wget curl tar unzip yum-utils vi iputils jq findutils

wget https://download.clis.cloud.ibm.com/ibm-cloud-cli/"$IBM_CLOUD_VERSION"/IBM_Cloud_CLI_"$IBM_CLOUD_VERSION"_"$ARCH".tar.gz
tar -xvzf ./IBM_Cloud_CLI_"$IBM_CLOUD_VERSION"_"$ARCH".tar.gz
chmod +x ./Bluemix_CLI/install && ./Bluemix_CLI/install
rm -rf ./Bluemix_CLI/ ./IBM_Cloud_CLI_"$IBM_CLOUD_VERSION"_"$ARCH".tar.gz

ibmcloud update --force
ibmcloud plugin install power-iaas -f
ibmcloud plugin install vpc-infrastructure -f
ibmcloud plugin install cloud-object-storage -f
ibmcloud plugin update --all -f

#curl -sL https://raw.githubusercontent.com/ocp-power-automation/openshift-install-power/master/openshift-install-powervs -o /usr/local/bin/openshift-install-powervs

git clone https://github.com/rpsene/openshift-install-power.git
mv ./openshift-install-power/openshift-install-powervs /usr/local/bin/

chmod +x /usr/local/bin/openshift-install-powervs

yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo; microdnf install -y "$TERRAFORM_VERSION"

terraform --version && ibmcloud --version