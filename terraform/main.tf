resource "azurerm_resource_group" "fabric_rg" {
  name     = "fabric-iac-${var.environment}-rg"
  location = var.location

  tags = {
    environment = var.environment
    project     = "fabric-iac-playground"
    managed_by  = "terraform"
  }
}

resource "fabric_workspace" "sandbox" {
  display_name = "fabric-iac-${var.environment}"
  description  = "IaC sandbox workspace (${var.environment}) — managed by Terraform"
}

resource "fabric_workspace_role_assignment" "admin" {
  workspace_id = fabric_workspace.sandbox.id
  role         = "Admin"
  principal = {
    id   = "11275b3f-c568-4c60-b04d-fe7228049c15"
    type = "User"
  }
}

resource "fabric_lakehouse" "main" {
  workspace_id = fabric_workspace.sandbox.id
  display_name = "fabric-iac-${var.environment}-lakehouse"
  description  = "Managed by Terraform"
}

resource "fabric_workspace" "sandbox" {
  display_name = "fabric-iac-${var.environment}"
  description  = "IaC sandbox workspace (${var.environment}) — managed by Terraform"
  capacity_id  = "8690b09e-2239-448c-b545-fcde775def32"
}