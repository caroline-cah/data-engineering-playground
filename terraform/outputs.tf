output "resource_group_name" {
  value = azurerm_resource_group.fabric_rg.name
}

output "fabric_workspace_id" {
  value       = fabric_workspace.sandbox.id
  description = "The Fabric workspace ID — use this to reference the workspace in Fabric portal or subsequent resources"
}

output "fabric_workspace_name" {
  value = fabric_workspace.sandbox.display_name
}

output "lakehouse_id" {
  value = fabric_lakehouse.main.id
}

output "pipeline_id" {
  value = fabric_data_pipeline.vessel_eta_ingestion.id
}