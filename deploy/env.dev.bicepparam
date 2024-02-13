using 'main.bicep'

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
param rgMgmtPlaneName = 'rg-mgmt-plane'

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
