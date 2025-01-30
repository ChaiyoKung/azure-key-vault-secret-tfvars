resource "azurerm_resource_group" "example" {
  name     = "rg-azure-key-vault-secret-tfvars"
  location = "Southeast Asia"
}

resource "azurerm_service_plan" "example" {
  name                = "asp-azure-key-vault-secret-tfvars"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  os_type             = "Linux"
  sku_name            = "F1"
}

resource "azurerm_linux_web_app" "example" {
  name                = "app-azure-key-vault-secret-tfvars"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  service_plan_id     = azurerm_service_plan.example.id

  site_config {
    always_on = false
  }

  app_settings = {
    APP_NAME    = "Azure Key Vault Secret tfvars"
    APP_API_KEY = data.azurerm_key_vault_secret.example.value
  }
}

data "azurerm_key_vault_secret" "example" {
  name         = "app-api-key"
  key_vault_id = "/subscriptions/28bd5fa2-47f8-46e7-9fc9-690213f03d8c/resourceGroups/rg-azure-key-vault-secret-tfvars/providers/Microsoft.KeyVault/vaults/kv-secret-tfvars"
}
