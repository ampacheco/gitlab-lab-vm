#!/bin/bash

# ssh session
ssh azureuser@<ip_address>

# over ssh
service jenkins status

# get jenkins IP
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
