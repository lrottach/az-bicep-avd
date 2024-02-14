# Azure Virtual Desktop - Azure Bicep Deployment

This repository is dedicated to the deployment of Azure Virtual Desktop using Azure Bicep and Azure Deployment Stacks.  
The primary goal of this project is to deploy every aspect of the Azure Virtual Desktop environment using Azure Bicep, a declarative language for describing and deploying Azure resources.

This project is designed for demonstration purposes, providing a practical example of how to use Azure Bicep for Infrastructure as Code (IaC) implementations.

## Prerequisites

Not all resources required for a fully functional Azure Virtual Desktop environment will be provisioned by this deployment. Ensure you've set up the following resources:

* Azure Log Analytics Workspace
* Azure KeyVault containing the following secrets:
    * Local VM password
    * Domain join service account
    * Domain join password
* Azure Virtual Network with at least one available subnet

Please note that this project is a work in progress and contributions are welcome. For more information on how to contribute, please see the CONTRIBUTING.md file.
