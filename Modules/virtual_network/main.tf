resource "azurerm_virtual_network" "virtual_network" {
  count               = var.count
  name                = format("vnet-%s-%s-%s-%03d", var.application, var.environment, var.location, count.index + 1)
  address_space       = var.address_space
  location            = var.location
  resource_group_name = var.resource_group_name

  tags = var.tags
}