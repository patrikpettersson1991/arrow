#/bin/bash
source conf/config.cfg
echo "Creating Public IP in resource group: $RG "
az network public-ip create --resource-group $RG --name $RG-bastion-ip --sku Standard --location westeurope -o table
echo ""
echo -e "Creating Bastion in $RG with "
az network bastion create --name $RG-bastion --public-ip-address $RG-bastion-ip --resource-group $RG --vnet-name $RG-vn001 --location westeurope -o table
echo ""
az vm list --resource-group $RG -o table
