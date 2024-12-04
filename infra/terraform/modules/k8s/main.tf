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

# Habilita o serviço Cloud Build API no projeto
resource "google_project_service" "cloud_build" {
  project            = var.id_project
  service            = "cloudbuild.googleapis.com"
  disable_on_destroy = false
}

# Cria um cluster Kubernetes no GKE
resource "google_container_cluster" "primary" {
  depends_on = [google_project_service.kubernetes_api]
  name                     = var.cluster_name
  location                 = var.cluster_location
  remove_default_node_pool = true
  initial_node_count       = var.initial_node_count
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
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}

# Cria um repositório Docker para o projeto
resource "google_artifact_registry_repository" "docker_repo" {
  provider      = google
  depends_on = [google_project_service.cloud_build]
  project       = var.id_project
  repository_id = var.artifact_repository_name
  location      = var.artifact_region
  format        = "DOCKER"
  description   = "Repositório Docker para o projeto Longeviver Fitness"
}

# Concede permissões à Service Account
resource "google_project_iam_member" "artifact_registry_admin" {
  depends_on = [google_service_account.service_account_k8s]
  project = var.id_project
  role    = "roles/artifactregistry.admin"
  member  = "serviceAccount:${google_service_account.service_account_k8s.email}"
}

resource "google_project_iam_member" "cloud_run_admin" {
  depends_on = [google_service_account.service_account_k8s]
  project = var.id_project
  role    = "roles/run.admin"
  member  = "serviceAccount:${google_service_account.service_account_k8s.email}"
}

resource "google_project_iam_member" "cloud_run_builder" {
  depends_on = [google_service_account.service_account_k8s]
  project = var.id_project
  role    = "roles/run.builder"
  member  = "serviceAccount:${google_service_account.service_account_k8s.email}"
}

resource "google_project_iam_member" "kubernetes_engine_admin" {
  depends_on = [google_service_account.service_account_k8s]
  project = var.id_project
  role    = "roles/container.admin"
  member  = "serviceAccount:${google_service_account.service_account_k8s.email}"
}

resource "google_project_iam_member" "service_account_user" {
  depends_on = [google_service_account.service_account_k8s]
  project = var.id_project
  role    = "roles/iam.serviceAccountUser"
  member  = "serviceAccount:${google_service_account.service_account_k8s.email}"
}

resource "google_project_iam_member" "storage_admin" {
  depends_on = [google_service_account.service_account_k8s]
  project = var.id_project
  role    = "roles/storage.admin"
  member  = "serviceAccount:${google_service_account.service_account_k8s.email}"
}
