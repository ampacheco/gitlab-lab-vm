#!/bin/bash

az group create --name jenkins-get-started-rg --location eastus

az vm create \
--resource-group jenkins-get-started-rg \
--name jenkins-get-started-vm \
--image UbuntuLTS \
--public-ip-sku Standard \
--custom-data cloud-init-jenkins.txt

# Change admin
echo az vm user update --username azureroot --ssh-key-value "$(< <path-to-ssh-file>)" --name vault-01-vm --resource-group vault-01-rg

# Oepn all port from my local IP
LOCAL_IP=$(curl -sL ifconfig.me) && az network nsg rule create -g vault-01-rg --nsg-name allow-all-port-traffic-from-home-ip -n vault-01-rg --priority 1100 --source-address-prefixes ${LOCAL_IP} --source-port-ranges '*' --destination-address-prefixes '*' --destination-port-ranges '*' --access Allow --protocol Tcp --description "Allow all ports traffic from home ip"


az vm list -d -o table --query "[?name=='jenkins-get-started-vm']"

az vm show \
--resource-group jenkins-get-started-rg \
--name jenkins-get-started-vm -d \
--query [publicIps] \
--output tsv