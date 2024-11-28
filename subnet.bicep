@description('Module for creating a Subnet')
param subnetName string
param vnetName string
param addressPrefix string

resource subnet 'Microsoft.Network/virtualNetworks/subnets@2023-02-01' = {
  name: '${vnetName}subnets/${subnetName}'  // Correct name format
  properties: {
    addressPrefix: addressPrefix
  }
}

output subnetId string = subnet.id

