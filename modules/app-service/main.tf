resource "azurerm_service_plan" "this" {
  name                = "app-service-plan-1"
  resource_group_name = var.resource_group_name
  location            = var.location
  os_type             = "Linux"
  sku_name            = "P1v2"
  tags                = var.tags
}

resource "azurerm_linux_web_app" "this" {
  name                = "my-linux-webapp-1"
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = azurerm_service_plan.this.id
  tags                = var.tags

  site_config {}
}
locals {
  slot_env = lower(var.environment)

  slot_names = {
    slot_1 = "slot1-${local.slot_env}"
    slot_2 = "slot2-${local.slot_env}"
  }
}

resource "azurerm_linux_web_app_slot" "this" {
  for_each = local.slot_names

  name           = each.value
  app_service_id = azurerm_linux_web_app.this.id
  tags           = var.tags

  site_config {}
}
