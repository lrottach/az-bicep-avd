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
