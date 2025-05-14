# Este módulo cria um cluster Kubernetes no Google Kubernetes Engine (GKE) com um Node Pool personalizado.
data "google_project" "project" {
  project_id = var.id_project
}

# Cria uma Service Account que será utilizada pelos nós do Kubernetes
resource "google_service_account" "service_account_k8s" {
  account_id   = "k8s-service-account"
  display_name = "Service Account para Kubernetes"
}

# Habilita a Kubernetes Engine API no projeto automaticamente
resource "google_project_service" "kubernetes_api" {
  project            = var.id_project
  service            = "container.googleapis.com"
  disable_on_destroy = false
}

# Cria um cluster Kubernetes no GKE
resource "google_container_cluster" "primary" {
  depends_on = [google_project_service.kubernetes_api]
  name                     = var.cluster_name
  location                 = var.cluster_location
  remove_default_node_pool = true
  initial_node_count       = var.initial_node_count
  workload_identity_config {
    workload_pool = "${var.id_project}.svc.id.goog"
  }
  deletion_protection      = false
}

# Cria um Node Pool personalizado para o cluster Kubernetes
resource "google_container_node_pool" "primary_preemptible_nodes" {
  depends_on = [google_service_account.service_account_k8s]
  name       = var.name_node_pool
  location   = var.cluster_location
  cluster    = google_container_cluster.primary.name
  node_count = 1

  node_config {
    preemptible     = var.preemptible
    machine_type    = var.node_machine_type
    service_account = google_service_account.service_account_k8s.email
    oauth_scopes    = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
    workload_metadata_config {
      mode        = "GKE_METADATA"
    }
  }
}

# Concede permissões à Service Account
resource "google_project_iam_member" "cloud_sql_client_role" {
  depends_on = [google_service_account.service_account_k8s]
  project = var.id_project
  role    = "roles/cloudsql.client"
  member  = "serviceAccount:${google_service_account.service_account_k8s.email}"
}

# Utilizado pelo app para registrar logs
resource "google_project_iam_member" "logging_writer_role" {
  depends_on = [google_service_account.service_account_k8s]
  project = var.id_project
  role    = "roles/logging.logWriter"
  member  = "serviceAccount:${google_service_account.service_account_k8s.email}"
}

resource "google_project_iam_member" "artifact_registry_reader" {
  depends_on = [google_service_account.service_account_k8s]
  project = var.id_project
  role    = "roles/artifactregistry.reader"
  member  = "serviceAccount:${google_service_account.service_account_k8s.email}"
}

resource "google_project_iam_member" "cluster_viewer_role" {
  depends_on = [google_service_account.service_account_k8s]
  project = var.id_project
  role    = "roles/container.clusterViewer"
  member  = "principal://iam.googleapis.com/projects/${data.google_project.project.number}/locations/global/workloadIdentityPools/${var.id_project}.svc.id.goog/subject/ns/${var.cluster_namespace}/sa/${var.ksa_name}"
}

resource "google_service_account_iam_member" "workload_identity_user_role" {
  depends_on         = [google_service_account.service_account_k8s]
  service_account_id = google_service_account.service_account_k8s.name
  role               = "roles/iam.workloadIdentityUser"
  member             = "serviceAccount:${var.id_project}.svc.id.goog[${var.cluster_namespace}/${var.ksa_name}]"
}