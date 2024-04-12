# Terraform Variables

variable "resource_group_prefix" {
  type        = string
  default     = "rg-terraform-dev2"
  description = "Resource Group Prefix"
}

variable "resource_group_name" {
  type        = string
  default     = "rg-terraform-dev2"
  description = "Resource Group Name"
}

variable "location" {
  type        = string
  default     = "West Europe"
  description = "Location of the resource group."
}