resource "kubernetes_namespace" "cluster_namespace" {
  metadata {
    name = "${var.project_id}-namespace"
  }
}

resource "kubernetes_service_account" "ksa" {
  metadata {
    name      = "${var.project_id}-ksa"
    namespace = kubernetes_namespace.cluster_namespace.metadata[0].name
    annotations = {
      "iam.gke.io/gcp-service-account" = var.service_account_k8s_email
    }
  }
}
