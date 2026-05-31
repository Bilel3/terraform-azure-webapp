variable "subscription_id" {
  description = "Azure subscription ID used by this environment"
  type        = string
}

variable "environment" {
  description = "Environment name"

  type = string

  validation {
    condition     = contains(["dev", "prd"], lower(var.environment))
    error_message = "Environment must be either 'dev' or 'prd'."
  }
}

variable "location" {
  description = "Azure region for resources"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name"
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
  description = "Additional tags applied to resources"
  type        = map(string)
  default     = {}
}