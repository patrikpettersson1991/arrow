//az group create --location swedencentral --resource-group lisub-rg-bic1
//The above command creates the group

// Deploy this template with
// az deployment group create --resource-group lisub-rg-bic1 \ 
// --template-file .\repos\ar\bicep\initial.bicep
//@description('The number of subnets to create')
//param numberOfsubnets 

@description('VNet name')
// param vnetName string = '-vnet001'
param vnetName string = '${resourceGroup().name}-vn001'

@description('VNet Address prefix, the first two octets the rest will be added automatically')
param vnetPrefix string
param vnetAddressPrefix string = '${vnetPrefix}.0.0/16'


@description('Firewall 1 Name')
param firewallName string = 'AzureFirewallSubnet'
@description('Firewall 1 Prefix should be first net in vnet')
param firewallPrefix string = '${vnetPrefix}.1.0/24'

@description('AzureBastionSubnet')
param azureBastionsubnet string = 'AzureBastionSubnet'
param aBsn string = '${vnetPrefix}.2.0/24'

@description('DMZ network')
param subnetDMZ string = '${resourceGroup().name}dmz001'
param subnetDMZPrefix string = '${vnetPrefix}.3.0/24'

@description('Subnet 1 Prefix')
param subnet1Prefix string = '${vnetPrefix}.11.0/24'

@description('Subnet 1 Win')
param subnet1Name string = '${resourceGroup().name}srv001'

@description('Subnet 2 Prefix')
param subnet2Prefix string = '${vnetPrefix}.12.0/24'

@description('Subnet 2 Lin')
param subnet2Name string = '${resourceGroup().name}srv002'

@description('Subnet 3 Prefix')
param subnet3Prefix string = '${vnetPrefix}.13.0/24'

@description('Subnet 3 DBnet')
param subnet3Name string = '${resourceGroup().name}srv003'
@description('Location for all resources.')

param location string = resourceGroup().location

resource vnet 'Microsoft.Network/virtualNetworks@2021-08-01' = {
  name: vnetName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        vnetAddressPrefix 
      ]
    }
    subnets: [
      {
        name: firewallName
        properties: {
          addressPrefix: firewallPrefix
        }
      }
      {
        name: azureBastionsubnet
        properties: {
          addressPrefix: aBsn
        }
      }
      {
        name: subnetDMZ
        properties: {
          addressPrefix: subnetDMZPrefix
        }
      }
      {
        name: subnet1Name
        properties: {
          addressPrefix: subnet1Prefix
        }
      }
      {
        name: subnet2Name
        properties: {
          addressPrefix: subnet2Prefix
        }
      }
      {
        name: subnet3Name
        properties: {
          addressPrefix: subnet3Prefix
        }
      }
    ]
  }
}
