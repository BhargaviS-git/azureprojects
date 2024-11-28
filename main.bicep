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



