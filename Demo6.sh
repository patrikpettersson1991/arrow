#!/bin/bash
source conf/config.cfg
az group delete --name $RG1 -y --no-wait
az group delete --name $RG -y 

az group list
