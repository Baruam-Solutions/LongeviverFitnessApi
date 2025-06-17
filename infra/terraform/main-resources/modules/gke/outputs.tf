output "cluster_name" {
  value = google_container_cluster.primary.name
}

output "service_account_k8s_email" {
  value = google_service_account.service_account_k8s.email
}

output "service_account_k8s_name" {
  value = google_service_account.service_account_k8s.name
}

output "kubernetes_endpoint" {
  value = google_container_cluster.primary.endpoint
}

output "cluster_ca_certificate" {
  value = google_container_cluster.primary.master_auth[0].cluster_ca_certificate
}