variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "location" {
  description = "Azure region for resources"
  type        = string
}

variable "vnet_name" {
  description = "Virtual network name"
  type        = string
}

variable "vnet_address_space" {
  description = "Virtual network CIDR ranges"
  type        = list(string)
}

variable "tags" {
  description = "Tags applied to resources"
  type        = map(string)
  default     = {}
}
