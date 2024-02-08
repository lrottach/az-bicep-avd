import { tagParameterObject } from 'types/parameters.types.bicep'

// ---------------------------------------------------------------------------------- 
// 
//    Type: Main 
//    Author: Lukas Rottach 
//    Version: 0.1 
//    Provider: --- 
//    Description: Deployment of a demo environment for Azure Virtual Desktop
//    Reference: https://github.com/lrottach/az-bicep-avd
// 
// ----------------------------------------------------------------------------------

// Target Scope
targetScope = 'subscription'

// ------------------------------ 
// Parameter Area 
// ------------------------------

// Deployment Parameter
@allowed([ 'Switzerland North', 'Switzerland West', 'West Europe' ])
param deploymentRegion string = 'West Europe'

@description('Name of the target Resource Group for all resource deployments')
param rgMgmtPlaneName string

// Tagging
param tags tagParameterObject

// ------------------------------ 
// Resource Area 
// ------------------------------

// Resource Group - Management Plane
resource rg_mgmtplane 'Microsoft.Resources/resourceGroups@2023-07-01' = {
  name: rgMgmtPlaneName
  location: deploymentRegion
  tags: tags
}
