variable "count" {
  type = number
  default = 1
  description = "Number of key vaults"
}

variable "application" {
  type = string
  description = "Application name"
}

variable "environment" {
  type = string
  description = "Environment name"
}

variable "location" {
  type = string
  description = "Azure region for the resource group"
}

variable "resource_group_name" {
  type = string
  description = "Name of the resource group"
}

variable "sku_name" {
  type = string
  default = "standard"
  description = "SKU name for the Key Vault"
}

variable "soft_delete_retention_days" {
  type = number
  default = 7
  description = "Number of days to retain soft-deleted Key Vaults"
}

variable "purge_protection_enabled" {
  type = bool
  default = true
  description = "Whether purge protection is enabled for the Key Vault"
}

variable "public_network_access_enabled" {
  type = bool
  default = true
  description = "Whether public network access is enabled for the Key Vault"
}

variable "default_action" {
  type = string
  default = "Deny"
  description = "Default action for the Key Vault network ACLs"
}

variable "bypass" {
  type = string
  default = "None"
  description = "List of services to bypass the Key Vault network ACLs"
}

variable "rbac_authorization_enabled" {
  type = bool
  default = true
  description = "Whether RBAC is enabled for deployment on the Key Vault"
}

variable "tags" {
  type = map(string)
  description = "Tags for the Key Vault"
}
