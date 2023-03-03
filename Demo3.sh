#/bin/bash
source conf/config.cfg
#echo "Creating VM E-series VM $VM3 in resource group: $RG "
#az deployment group create --resource-group $RG --template-file vmlin/vm.bicep --parameters vmSize='Standard_E2ads_v5' vmName=$VM3 adminUsername=auser adminPasswordOrKey=$adminPW -o table
echo ""


echo "Creating VM $VM1 in resource group: $RG "
az deployment group create --resource-group $RG --template-file vmlin/vm.bicep --parameters vmName=$VM1 adminUsername=auser adminPasswordOrKey=$adminPW
echo "Creating VM $VM2 in resource group: $RG "
az deployment group create --resource-group $RG --template-file vmlin/vm.bicep --parameters vmName=$VM2 adminUsername=auser adminPasswordOrKey=$adminPW
echo "Creating VM $VM3 in resoource group $RG"
az deployment group create --resource-group $RG --template-file vmwin/win.bicep --parameters vmName=$VM3 adminUsername=auser adminPassword=$adminPW -o table
az vm list -o table |grep $RG