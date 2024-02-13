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

// * Location Parameter
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
@sealed()
type avdWorkspaceParameterObject = {
  name: string
  location: locationParameterObject
  description: string
  friendlyName: string
}

// AVD - Host Pool
@sealed()
type poolParameterObject = {
  name: string
  location: locationParameterObject
  friendlyName: string
  description: string?
  maxSessionLimit: int
  validationEnvironment: bool
  startVmOnConnect: bool
  hostpoolType: 'Pooled' | 'Personal'
  loadBalancerType: 'BreadthFirst' | 'DepthFirst' | 'Persistent'
  preferredAppGroupType: 'Desktop' | 'None' | 'RailApplications'
}

// AVD - Host Pool Array
@export()
type poolParameterArrayObject = poolParameterObject[]

// AVD - Application Group
