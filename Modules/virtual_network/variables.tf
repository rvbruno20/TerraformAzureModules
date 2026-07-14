variable "count" {
  type = number
  default = 1
  description = "Number of virtual networks"
}

variable "address_space" {
  type = list(string)
  description = "Address space for the virtual network"
}   

variable "location" {
  type = string
  description = "Azure location"
}

variable "resource_group_name" {
  type = string
  description = "Name of the resource group"
}

variable "tags" {
  type = map(string)
  description = "Tags for the virtual network"
}

variable "environment" {
  type = string
  description = "Environment name"
}   

variable "application" {
  type = string
  description = "Application name"
}