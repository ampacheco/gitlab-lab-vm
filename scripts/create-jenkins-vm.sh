#!/bin/bash
az group create --name jenkins-get-started-rg --location eastus


# vm created with ssh key required
az vm create \                                                                                                                                                             [21:24:29]
--resource-group jenkins-get-started-rg \
--name jenkins-get-started-vm \
--image UbuntuLTS \
--public-ip-sku Standard \
--custom-data cloud-init-jenkins.txt \
--admin-username azureroot \
--ssh-key-values <path-to-ssh-file>


# Oepn all port from my local IP
LOCAL_IP=$(curl -sL ifconfig.me) \ 
&& az network nsg rule create \
-g jenkins-get-started-rg \
--nsg-name jenkins-get-started-vmNSG \
-n allow-all-inbound-traffic-from-local-ip \
--priority 1100 \
--source-address-prefixes ${LOCAL_IP} \
--source-port-ranges '*' \
--destination-address-prefixes '*' \
--destination-port-ranges '*' \
--access Allow \
--protocol Tcp \
--description "Allow all inbound traffic from the local IP."

# Get VM Details
az vm list -d -o table --query "[?name=='jenkins-get-started-vm']"

az vm show \
--resource-group jenkins-get-started-rg \
--name jenkins-get-started-vm -d \
--query '[publicIps]' \
--output tsv