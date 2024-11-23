output "bucket_name_from_module" {
  value = module.terraform_state_storage.bucket_name
  description = "Nome do cloud storage bucket para armazenar terraform state"
}

output "db_instance_connection_name_from_module" {
  value = module.dev_rds.db_instance_connection_name_from_module
  description = "Nome da conexão da instância da database"
}

output "pool_name" {
  value = module.dev_rds.pool_name
}

output "github_actions_service_account_email" {
  value = module.dev_rds.github_actions_service_account_email
}

output "artifact_registry_repository" {
  value = module.dev_rds.artifact_registry_repository
}

output "pool_provider_id" {
  value = module.dev_rds.pool_provider_id
}

output "pool_provider_name" {
  value = module.dev_rds.pool_provider_name
}

output "artifact_repository_name" {
  value = module.dev_rds.artifact_repository_name
}