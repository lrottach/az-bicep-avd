# Azure Virtual Desktop - Azure Bicep deployment
Azure Virtual Desktop deployment using Azure Bicep as IaC implementation

## Prerequisites
Not all resources required for a fully functional Azure Virtual Desktop environment will be provisoned by this deployment
Make sure you've setup the following resources.
* Azure Log Analytics Workspace
* Azure KeyVault containing the following secrets
** Local VM password
** Domain join service account
** Domain join password
* Azure Virtual Network with at least one available subnet