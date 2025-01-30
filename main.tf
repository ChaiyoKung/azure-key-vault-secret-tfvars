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
    APP_API_KEY = var.app_api_key
  }
}
