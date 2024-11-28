@description('Module for creating a Virtual Network')
param vnetName string
param location string
param addressPrefixes array
param tags object = {}

resource vnet 'Microsoft.Network/virtualNetworks@2023-02-01' = {
  name: vnetName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: addressPrefixes
    }
  }
  tags: tags
}

output vnetId string = vnet.id
