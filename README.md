# Azure Key Vault Secret tfvars

Migrate Terraform secret variables to Azure Key Vault secrets

## Getting Started

Login to Azure.

```bash
az login
```

Initialize the Terraform configuration.

```bash
terraform init
```

## Development

Create a plan.

```bash
terraform plan -no-color -out tfplan > tfplan.txt
```

Apply the plan.

```bash
terraform apply "tfplan"
```

## Migrate Terraform secret variables to Azure Key Vault secret

Using `azurerm_key_vault_secret` data source to retrieve the secret value from Azure Key Vault.\
Learn more: <https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault_secret>

```diff
resource "azurerm_linux_web_app" "example" {
  name                = "app-azure-key-vault-secret-tfvars"
  location            = azurerm_resource_group.example.location
  ...

  app_settings = {
    APP_NAME    = "Azure Key Vault Secret tfvars"
-   APP_API_KEY = var.app_api_key
+   APP_API_KEY = data.azurerm_key_vault_secret.example.value
  }
}

- variable "app_api_key" {
-   type      = string
-   sensitive = true
- }
+ data "azurerm_key_vault_secret" "example" {
+   name         = "app-api-key"
+   key_vault_id = "/subscriptions/28bd5fa2-47f8-46e7-9fc9-690213f03d8c/resourceGroups/rg-azure-key-vault-secret-tfvars/providers/Microsoft.KeyVault/vaults/kv-secret-tfvars"
+ }
```
