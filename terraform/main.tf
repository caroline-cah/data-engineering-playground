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
  workspace_id = fabric_workspace.main.id
  principal_id = "11275b3f-c568-4c60-b04d-fe7228049c15"
  principal_type = "User"
  role = "Admin"
}