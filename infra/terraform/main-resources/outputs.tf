output "k8s_service_account_email" {
  value = module.gke.service_account_k8s_email
}

output "k8s_service_account_name" {
  value = module.gke.service_account_k8s_name
}

output "k8s_endpoint" {
  value = module.gke.kubernetes_endpoint
}

output "k8s_certificate_authority" {
  value = module.gke.cluster_ca_certificate
}