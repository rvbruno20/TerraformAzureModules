# Storage accounts need to be unique
resource "random_string" "salt" {
  length  = 6
  special = false
  lower   = true
  numeric = false
}

resource "azurerm_storage_account" "storage_account" {

  name                = lower("${var.platform}${var.environment}sa${var.application}${random_string.salt.result}")
  location            = var.location
  resource_group_name = var.resource_group_name

  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_replication_type

  min_tls_version                 = "TLS1_2"
  shared_access_key_enabled       = false
  public_network_access_enabled   = false
  allow_nested_items_to_be_public = false

  blob_properties {

    delete_retention_policy {
      days = 30
    }

    container_delete_retention_policy {
      days = 30
    }

    versioning_enabled = true

  }

  tags = var.common_tags

  depends_on = [random_string.salt]
}

resource "azurerm_private_endpoint" "storage_blob" {
  name                = "${azurerm_storage_account.storage_account.name}-blob-pe"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.private_endpoint_subnet_id

  private_service_connection {
    name                           = "${azurerm_storage_account.storage_account.name}-blob-pe"
    private_connection_resource_id = azurerm_storage_account.storage_account.name
    subresource_names              = ["blob"]
    is_manual_connection           = false
  }

  private_dns_zone_group {
    name = "default"

    private_dns_zone_ids = [
      var.private_vault_dns_zone
    ]
  }

  depends_on = [azurerm_storage_account.storage_account]

  tags = var.common_tags
}