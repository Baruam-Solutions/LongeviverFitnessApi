resource "kubernetes_namespace" "cluster_namespace" {
  depends_on = var.cluster_name
  metadata {
    name = "${var.id_project}-namespace"
  }
}

resource "kubernetes_service_account" "ksa" {
  depends_on = kubernetes_namespace.cluster_namespace
  metadata {
    name      = "${var.id_project}-ksa"
    namespace = kubernetes_namespace.cluster_namespace.metadata.0.name
    annotations = {
      "iam.gke.io/gcp-service-account" = var.service_account_k8s_email
    }
  }
}

resource "kubernetes_secret" "gke-cloud-sql-secrets" {
  metadata {
    name      = "gke-cloud-sql-secrets"
    namespace = kubernetes_namespace.cluster_namespace.metadata.0.name
  }
  data = {
    database = var.database
    username = var.username
    password = var.password
  }
}