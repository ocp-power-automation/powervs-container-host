#!/bin/bash

microdnf update; microdnf install -y git vi wget curl tar unzip yum-utils iputils jq findutils

wget https://download.clis.cloud.ibm.com/ibm-cloud-cli/"$IBMCLOUD_VERSION"/IBM_Cloud_CLI_"$IBMCLOUD_VERSION"_"$ARCH".tar.gz

tar -xvzf ./IBM_Cloud_CLI_"$IBMCLOUD_VERSION"_"$ARCH".tar.gz

chmod +x ./Bluemix_CLI/install && ./Bluemix_CLI/install

ibmcloud update --force

rm -rf ./Bluemix_CLI/ "./IBM_Cloud_CLI_$IBMCLOUD_VERSION_$ARCH.tar.gz"

ibmcloud plugin install power-iaas
ibmcloud plugin install vpc-infrastructure
ibmcloud plugin install cloud-object-storage

wget -O /usr/bin/terraform "https://oplab9.parqtec.unicamp.br/pub/ppc64el/terraform/terraform-$TERRAFORM"

chmod +x /usr/bin/terraform; mkdir -p /root/.terraform.d/plugins

wget "https://github.com/ocp-power-automation/terraform-providers-power/releases/download/$TF_PPC64LE_PROVIDERS/archive.zip"

unzip ./archive.zip -d /root/.terraform.d/plugins

#curl -sL https://raw.githubusercontent.com/ocp-power-automation/openshift-install-power/master/openshift-install-powervs -o /usr/local/bin/openshift-install-powervs

git clone https://github.com/rpsene/openshift-install-power.git
mv ./openshift-install-power/openshift-install-powervs /usr/local/bin/

chmod +x /usr/local/bin/openshift-install-powervs

ibmcloud plugin update --all -f; terraform --version && ibmcloud --version