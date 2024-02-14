import { tagParameterObject, appGroupParameterArrayObject } from '../../types/parameters.types.bicep'

// ********************************************************************************* 
// * 
// *    Type: User-Defined Data Types 
// *    Author: Lukas Rottach 
// *    Version: 0.1 
// *    Provider: --- 
// *    Description: Deployment of a demo environment for Azure Virtual Desktop
// *    Reference: https://github.com/lrottach/az-bicep-avd
// * 
// ********************************************************************************* 

// * Target Scope
// *************************
targetScope = 'resourceGroup'

// * Parameters
// *************************

// AVD - Application Group Parameter
param appGroups appGroupParameterArrayObject

// AVD - Host Pool Parameter
param hostPoolId string

// Tag Parameter
param tags tagParameterObject


// * Resources
// *************************

resource appGroup 'Microsoft.DesktopVirtualization/applicationGroups@2023-09-05' = [for appGroup in appGroups: {
 name: appGroup.name 
  location: appGroup.location
  tags: tags
  properties: {
    hostPoolArmPath: hostPoolId
    friendlyName: appGroup.friendlyName
    description: appGroup.description
    applicationGroupType: appGroup.appGroupType
  }
}]
