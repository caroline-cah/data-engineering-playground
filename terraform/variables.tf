variable "location" {
  description = "Azure region"
  type        = string
  default     = "swedencentral"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "capacity_id" {
  description = "Microsoft Fabric capacity ID to assign to the workspace"
  type        = string
}