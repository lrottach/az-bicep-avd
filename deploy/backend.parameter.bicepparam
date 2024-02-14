using 'main_backend.bicep'

// ********************************************************************************* 
// * 
// *    Type: Parameter 
// *    Environment: Development
// *    Author: Lukas Rottach 
// *    Version: 0.1 
// *    Provider: --- 
// *    Description: Deployment of a demo environment for Azure Virtual Desktop
// *    Reference: https://github.com/lrottach/az-bicep-avd
// * 
// ********************************************************************************* 

// Deployment Parameter
param deploymentRegion = 'West Europe'

// Resource Group Parameter
param rgMgmtPlaneName = 'rg-lzo-avd1-mgmt1-we'

// Network Parameter
param targetNetworkInformation = {
  vnetName: 'vnet-lzo-avd1-net1-we'
  vnetRgName: 'rg-lzo-avd1-net1-we'
  subnetName: 'ClientSubnet'
}

// Tag Parameter
param tags = {
  CreatedBy: 'lrottach@darkcontoso.io'
  CreatedOn: '01.01.2021'
  Environment: 'Development'
  ServiceDescription: 'Azure Virtual Desktop'
  ServiceUnit: 'LZO-AVD1'
  CostCenter: 'CC-00372X'
}

// AVD Management Plane Resources
param avdResources = [
  {
    name: 'w1-lzo-avd1-we'
    friendlyName: 'Dark Contoso Lab - Corporate'
    location: 'westeurope'
    hostPools: [
      {
        name: 'w1-hp1-lzo-avd1-we'
        friendlyName: 'SAP Desktop'
        location: 'westeurope'
        description: 'SAP Infrastructure'
        hostpoolType: 'Pooled'
        loadBalancerType: 'BreadthFirst'
        maxSessionLimit: 5
        preferredAppGroupType: 'Desktop'
        startVmOnConnect: false
        validationEnvironment: false
      }
    ]
  }
  {
    name: 'w2-lzo-avd1-we'
    friendlyName: 'Dark Contoso Lab - Integration'
    location: 'westeurope'
  }
]
