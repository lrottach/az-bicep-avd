// Tag Parameter
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

