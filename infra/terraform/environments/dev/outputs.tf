output "db_instance_connection_name_from_module" {
  value       = module.rds.db_instance_connection_name
  description = "Nome da conexão da instância da database"
}

output "artifact_registry_repository" {
  value = module.artifact_repository.artifact_registry_repository
}

output "kubernetes_endpoint" {
  value = module.k8s.kubernetes_endpoint
}

output "kubernetes_cluster_ca_certificate" {
  value = module.k8s.cluster_ca_certificate
}