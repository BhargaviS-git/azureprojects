targetScope = 'subscription'

@description('Name of the resource group to create')
param resourceGroupName string = 'vmfleetRG'

@description('Location of the resource group')
param location string = 'eastus'

resource resourceGroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: resourceGroupName
  location: location
}

output resourceGroupId string = resourceGroup.id

