data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "key_vault" {
  count               = var.count
  name                = format("kv-%s-%s-%s-%03d", var.application, var.environment, var.location, count.index + 1)
  location            = var.location
  resource_group_name = var.resource_group_name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = var.sku_name
  

  soft_delete_retention_days = var.soft_delete_retention_days
  purge_protection_enabled = var.purge_protection_enabled
  public_network_access_enabled = var.public_network_access_enabled
  rbac_authorization_enabled = var.rbac_authorization_enabled

  network_acls {
    default_action = var.default_action
    bypass         = var.bypass
  }

  tags = var.tags
}