import { poolParameterArrayObject, tagParameterObject } from '../../types/parameters.types.bicep'

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

// AVD - Host Pool Parameter
param poolData poolParameterArrayObject

@description('Optional. Host Pool token validity length. Usage: \'PT8H\' - valid for 8 hours; \'P5D\' - valid for 5 days; \'P1Y\' - valid for 1 year. When not provided, the token will be valid for 8 hours.')
param tokenValidityLength string = 'PT8H'

@description('Generated. Do not provide a value! This date value is used to generate a registration token.')
param baseTime string = utcNow('u')

// Tag Parameter
param tags tagParameterObject

// * Variables
// *************************
var tokenExpirationTime = dateTimeAdd(baseTime, tokenValidityLength)

// * Resources
// *************************

resource hp 'Microsoft.DesktopVirtualization/hostPools@2023-09-05' = [for pool in poolData: {
  name: pool.name
  location: pool.location
  tags: tags
  properties: {
    friendlyName: pool.friendlyName
    hostPoolType: pool.hostpoolType
    loadBalancerType: pool.loadBalancerType
    preferredAppGroupType: pool.preferredAppGroupType
    validationEnvironment: pool.validationEnvironment
    maxSessionLimit: pool.maxSessionLimit
    startVMOnConnect: pool.startVmOnConnect
    registrationInfo: {
      expirationTime: tokenExpirationTime
      registrationTokenOperation: 'Update'
    }
  }
}]
