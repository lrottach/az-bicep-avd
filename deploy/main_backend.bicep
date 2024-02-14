import { tagParameterObject, networkParameterObject, poolParameterArrayObject, avdMgmtPlaneObject } from 'types/parameters.types.bicep'

// ********************************************************************************* 
// * 
// *    Type: Main 
// *    Author: Lukas Rottach 
// *    Version: 0.1 
// *    Provider: --- 
// *    Description: Azure Virtual Desktop deployment - Backend
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

// AVD Parameter
param avdResources avdMgmtPlaneObject

// Tagging
param tags tagParameterObject

// * Resources
// *************************

// Resource Group - Management Plane
resource rg_mgmtplane 'Microsoft.Resources/resourceGroups@2023-07-01' = {
  name: rgMgmtPlaneName
  location: deploymentRegion
  tags: tags
}
