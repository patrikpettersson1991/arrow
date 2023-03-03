#/bin/bash
source conf/config.cfg
echo "Deploying network for resource group: $RG"
az deployment group create --resource-group $RG --template-file network/customNet.bicep --parameters vnetPrefix=$VN
az deployment group create --resource-group $RG1 --template-file network/customNet.bicep --parameters vnetPrefix=$VN1
echo -e "Network config created for resource group $RG \n \n"
az network vnet subnet list --resource-group $RG --vnet-name $RG-vn001 -o table
az network vnet subnet list --resource-group $RG1 --vnet-name $RG1-vn001 -o table