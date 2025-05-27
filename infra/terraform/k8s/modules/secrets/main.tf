resource "kubernetes_secret" "gke-cloud-sql-secrets" {
  metadata {
    name      = "gke-cloud-sql-secrets"
    namespace = var.cluster_namespace
  }
  data = {
    database = var.database
    username = var.username
    password = var.password
  }
}