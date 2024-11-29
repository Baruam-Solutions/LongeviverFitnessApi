output "db_instance_connection_name_from_module" {
  value = module.rds.db_instance_connection_name
  description = "Nome da conexão da instância da database"
}