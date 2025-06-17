data "google_project" "project" {
  project_id = var.project_id
}

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

resource "google_project_iam_member" "cluster_viewer_role" {
  project = var.project_id
  role    = "roles/container.clusterViewer"
  member  = "principal://iam.googleapis.com/projects/${data.google_project.project.number}/locations/global/workloadIdentityPools/${var.project_id}.svc.id.goog/subject/ns/${kubernetes_namespace.cluster_namespace.metadata[0].name}/sa/${kubernetes_service_account.ksa.metadata[0].name}"
}

resource "google_service_account_iam_member" "workload_identity_user_role" {
  service_account_id = var.service_account_k8s_name
  role               = "roles/iam.workloadIdentityUser"
  member             = "serviceAccount:${var.project_id}.svc.id.goog[${kubernetes_namespace.cluster_namespace.metadata[0].name}/${kubernetes_service_account.ksa.metadata[0].name}]"
}