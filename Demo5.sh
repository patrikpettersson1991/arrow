#/bin/bash
source conf/config.cfg

az vm run-command create --resource-group "$RG" --vm-name "$VM2" --name "InstallApache2AndStartIt" --script 'sudo apt install -y apache2 && sudo systemctl enable apache2' -o tsv
az vm run-command create --name "myRunCommand" --vm-name "$VM1" --resource-group "$RG" --script "echo Hello World!" -o tsv