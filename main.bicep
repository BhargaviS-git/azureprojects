param vmBaseName string
param vmCount int
param vmSize string
param location string
param adminUsername string
@secure()
param adminPassword string
param subnetId string

module vms './vmModule.bicep' = [for i in range(0, vmCount): {
  name: 'vm-${i}'
  params: {
    vmName: '${vmBaseName}-${i}'
    vmSize: vmSize
    location: location
    adminPassword: adminPassword
    subnetId: subnetId
    adminUsername: adminUsername
  }
}]

module vnetModule './vnet.bicep' = {
  name: 'vnetDeployment'
  params: {
    vnetName: 'vmfleetVNet'
    location: location
    addressPrefixes: [
      '10.0.0.0/16'
    ]
    tags: {
      environment: 'dev'
    }
  }
}

module nsgModule './nsg.bicep' = {
  name: 'nsgDeployment'
  params: {
    nsgName: 'vmfleetNSG'
    location: location
    securityRules: [
      {
        name: 'AllowHTTP'
        properties: {
          priority: 100
          protocol: 'Tcp'
          sourcePortRange: '*'
          destinationPortRange: '80'
          sourceAddressPrefix: '*'
          destinationAddressPrefix: '*'
          access: 'Allow'
          direction: 'Inbound'
        }
      }
    ]
    tags: {
      environment: 'dev'
    }
  }
}

module subnetModule './subnet.bicep' = {
  name: 'subnetDeployment'
  params: {
    subnetName: 'vmfleetSubnet'
    vnetId: vnetModule.outputs.vnetId
    addressPrefix: '10.0.1.0/24'
    nsgId: nsgModule.outputs.nsgId
  }
}




