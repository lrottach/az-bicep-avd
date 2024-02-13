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

// * Tag Parameter
// *************************
type locationParameterObject = 'switzerlandnorth' | 'westeurope' | 'northeurope'

// * Tag Parameter
// *************************
@export()
type tagParameterObject = {
  CreatedBy: string
  CreatedOn: string
  Environment: 'Production' | 'Development' | 'Integration' | 'Demo' | 'Test'
  CostCenter: string?
  ServiceDescription: string
  ServiceUnit: string
}

// * Network Parameter
// *************************
@export()
type networkParameterObject = {
  vnetName: string
  vnetRgName: string
  subnetName: string
}

// * Azure Virtual Desktop Parameter
// *************************

// AVD - Management Plane Parameter
type avdManagementPlaneParameterObject = {}

// AVD - Workspace
type avdWorkspaceParameterObject = {
  name: string
  location: locationParameterObject
  description: string
  friendlyName: string
}

// AVD - Host Pool


// AVD - Application Group
