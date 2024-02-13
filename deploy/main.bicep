import { tagParameterObject, networkParameterObject, poolParameterArrayObject } from 'types/parameters.types.bicep'

// ********************************************************************************* 
// * 
// *    Type: Main 
// *    Author: Lukas Rottach 
// *    Version: 0.1 
// *    Provider: --- 
// *    Description: Deployment of a demo environment for Azure Virtual Desktop
// *    Reference: https://github.com/lrottach/az-bicep-avd
// * 
// ********************************************************************************* 

// * Target Scope
// *************************
targetScope = 'subscription'

// * Parameter
// *************************

// Deployment Parameter
@allowed([ 'Switzerland North', 'Switzerland West', 'West Europe' ])
param deploymentRegion string = 'West Europe'

@description('Name of the target Resource Group for all resource deployments')
param rgMgmtPlaneName string

// Network information
param targetNetworkInformation networkParameterObject

// Tagging
param tags tagParameterObject

param testData poolParameterArrayObject = [
  {
    name: 'hp1'
    friendlyName: 'Host Pool 1'
    location: 'westeurope'
    maxSessionLimit: 9
    validationEnvironment: true
    startVmOnConnect: true
    hostpoolType: 'Pooled'
    loadBalancerType: 'BreadthFirst'
    preferredAppGroupType: 'Desktop'
  }
  {
    name: 'hp2'
    friendlyName: 'Host Pool 2'
    location: 'westeurope'
    maxSessionLimit: 9
    validationEnvironment: false
    startVmOnConnect: true
    hostpoolType: 'Pooled'
    loadBalancerType: 'DepthFirst'
    preferredAppGroupType: 'Desktop'
  }
  {
    name: 'hp3'
    friendlyName: 'Host Pool 3'
    location: 'westeurope'
    maxSessionLimit: 18
    validationEnvironment: true
    startVmOnConnect: false
    hostpoolType: 'Pooled'
    loadBalancerType: 'DepthFirst'
    preferredAppGroupType: 'Desktop'
  }
]

// * Resources
// *************************

// Resource Group - Management Plane
resource rg_mgmtplane 'Microsoft.Resources/resourceGroups@2023-07-01' = {
  name: rgMgmtPlaneName
  location: deploymentRegion
  tags: tags
}

module hp 'modules/Microsoft.DesktopVirtualization/hostpool.module.bicep' = {
  scope: rg_mgmtplane
  name: 'deploy-hp'
  params: {
    tags: tags
    poolData: testData
  }
}
