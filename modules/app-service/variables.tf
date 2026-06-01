variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "location" {
  description = "Azure region for resources"
  type        = string
}

variable "service_plan_sku_name" {
  description = "App Service Plan SKU name (for example: B1, S1, P1v2)"
  type        = string
  default     = "S1"

  validation {
    condition     = contains(["B1", "S1", "P1v2"], var.service_plan_sku_name)
    error_message = "service_plan_sku_name must be one of: B1, S1, P1v2."
  }
}

variable "environment" {
  description = "Environment name used for slot naming (dev/prd)"
  type        = string

  validation {
    condition     = contains(["dev", "prd"], lower(var.environment))
    error_message = "environment must be either 'dev' or 'prd'."
  }
}

variable "tags" {
  description = "Tags applied to resources"
  type        = map(string)
  default     = {}
}