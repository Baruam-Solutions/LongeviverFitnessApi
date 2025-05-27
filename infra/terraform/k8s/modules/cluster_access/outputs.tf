output "cluster_namespace" {
  value = kubernetes_namespace.cluster_namespace.metadata[0].name
}

output "ksa_name" {
  value = kubernetes_service_account.ksa.metadata[0].name
}