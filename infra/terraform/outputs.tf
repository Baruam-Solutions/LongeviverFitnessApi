output "bucket_name_from_module" {
  value = module.terraform_state_storage.bucket_name
  description = "Nome do cloud storage bucket para armazenar terraform state"
}

output "db_instance_connection_name_from_module" {
  value = module.dev_rds.db_instance_connection_name_from_module
  description = "Nome da conexão da instância da database"
}