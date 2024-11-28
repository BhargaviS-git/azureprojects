@description('Module for creating a Network Security Group')
param nsgName string
param location string
param securityRules array = []
param tags object = {}

resource nsg 'Microsoft.Network/networkSecurityGroups@2023-02-01' = {
  name: nsgName
  location: location
  properties: {
    securityRules: securityRules
  }
  tags: tags
}

output nsgId string = nsg.id
