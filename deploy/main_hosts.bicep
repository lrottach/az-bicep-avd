
import { tagParameterObject, networkParameterObject, poolParameterArrayObject, avdMgmtPlaneObject } from 'types/parameters.types.bicep'

// ********************************************************************************* 
// * 
// *    Type: Main 
// *    Author: Lukas Rottach 
// *    Version: 0.1 
// *    Provider: --- 
// *    Description: Azure Virtual Desktop deployment - Session Hosts
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

@description('Name of the target Resource Group for session hosts')
param rgName string

// Network Parameter
param targetNetworkInformation networkParameterObject

// Availability Set Parameter
param availabilitySetName string

// Tagging
param tags tagParameterObject
