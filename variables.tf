variable "project_name" {
  description = "The name of the project."
  type        = string
}

variable "environment" {
  description = "Environment name, e.g. prod."
  type        = string
}

variable "owner" {
  description = "Owner tag value."
  type        = string
}

variable "location" {
  description = "Azure region."
  type        = string
  default     = "southafricanorth"

  validation {
    condition     = var.location == "southafricanorth"
    error_message = "Location must be southafricanorth."
  }
}

variable "resource_group_name" {
  description = "Name of the existing resource group."
  type        = string
}

variable "public_ips" {
  description = "Map of public IPs to create. The key is used in the name, e.g. bastion or nat."
  type = map(object({
    allocation_method = optional(string, "Static")
    sku               = optional(string, "Standard")
  }))
  default = {}
}