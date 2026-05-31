variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "location" {
  description = "Azure region for resources"
  type        = string
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