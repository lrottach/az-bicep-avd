az stack sub create --name 'stack1-avd-dev' --location 'westeurope' --template-file ./deploy/main.bicep --parameters ./deploy/env.dev.bicepparam --deny-settings-mode 'DenyDelete' --delete-all --output jsonc