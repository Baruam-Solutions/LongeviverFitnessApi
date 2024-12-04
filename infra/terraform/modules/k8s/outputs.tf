output "cluster_name" {
  value = google_container_cluster.primary.name
}

output "kubernetes_endpoint" {
  value = google_container_cluster.primary.endpoint
}

output "artifact_registry_repository" {
  value = google_artifact_registry_repository.docker_repo.name
}