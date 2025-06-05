# Service Account para o GitHub Actions
resource "google_service_account" "github_actions" {
  account_id   = "github-actions-sa"
  display_name = "GitHub Actions SA"
}

# IAM para o GitHub Actions permissão de escrita no Artifact Registry
resource "google_artifact_registry_repository_iam_member" "artifact_registry_writer" {
  location   = var.project_region
  project    = var.project_id
  repository = var.artifact_registry_repository_name
  role       = "roles/artifactregistry.writer"
  member     = "serviceAccount:${google_service_account.github_actions.email}"
}

# IAM para o GitHub Actions permissão de leitura geral em todos os recursos de um projeto
resource "google_project_iam_member" "github_sa_project_viewer" {
  project = var.project_id
  role    = "roles/viewer"
  member  = "serviceAccount:${google_service_account.github_actions.email}"
}

# IAM para o GitHub Actions permissão de leitura no bucket para o Terraform State
resource "google_storage_bucket_iam_member" "terraform_backend_writer_reader" {
  bucket = var.terraform_bootstrap_state_bucket_name
  role   = "roles/storage.admin"
  member = "serviceAccount:${google_service_account.github_actions.email}"
}

# IAM para o GitHub Actions permissão de admin no GKE
resource "google_project_iam_member" "github_sa_project_permissions" {
  project = var.project_id
  role    = "roles/container.admin"
  member  = "serviceAccount:${google_service_account.github_actions.email}"
}

# IAM para o GitHub Actions permissão de admin no Cloud SQL
resource "google_project_iam_member" "github_sa_cloudsql_permissions" {
  project = var.project_id
  role    = "roles/cloudsql.admin"
  member  = "serviceAccount:${google_service_account.github_actions.email}"
}

# IAM para o GitHub Actions permissão de admin na Service Account
resource "google_project_iam_member" "github_sa_iam_permissions" {
  project = var.project_id
  role    = "roles/iam.serviceAccountAdmin"
  member  = "serviceAccount:${google_service_account.github_actions.email}"
}

# IAM para o GitHub Actions permissão de Workload Identity User
resource "google_project_iam_member" "github_sa_workload_identity_user" {
  project = var.project_id
  role    = "roles/iam.workloadIdentityUser"
  member  = "serviceAccount:${google_service_account.github_actions.email}"
}

# Workload Identity Pool para o GitHub Actions
resource "google_iam_workload_identity_pool" "github_pool" {
  project                   = var.project_id
  workload_identity_pool_id = var.gh_pool
  display_name              = "GitHub Actions Pool"
}

# Permissão para o GitHub Actions usar a Service Account padrão do Compute Engine.
# todo: Talvez seja necessário alterar o service_account_id para o gke/main/service_account_k8s
resource "google_service_account_iam_member" "github_sa_compute_default_user" {
  service_account_id = "projects/${var.project_id}/serviceAccounts/${var.project_number}-compute@developer.gserviceaccount.com"
  role               = "roles/iam.serviceAccountUser"
  member             = "serviceAccount:${google_service_account.github_actions.email}"
}

# Permissão para gerenciar IAM em nível de projeto
resource "google_project_iam_member" "github_sa_project_iam_admin" {
  project = var.project_id
  role    = "roles/resourcemanager.projectIamAdmin"
  member  = "serviceAccount:${google_service_account.github_actions.email}"
}

# Workload Identity Provider para o GitHub Actions
resource "google_iam_workload_identity_pool_provider" "github_provider" {
  project                            = var.project_id
  workload_identity_pool_id          = google_iam_workload_identity_pool.github_pool.workload_identity_pool_id
  workload_identity_pool_provider_id = var.gh_provider

  display_name = "GitHub Actions Provider"
  description  = "Federated identity for GitHub Actions"

  attribute_mapping = {
    "google.subject"       = "assertion.sub"
    "attribute.repository" = "assertion.repository"
  }

  attribute_condition = "attribute.repository == '${var.github_repo}'"

  oidc {
    issuer_uri = "https://token.actions.githubusercontent.com"
  }
}

# Permitir que o repositório GitHub use a Service Account
resource "google_service_account_iam_binding" "allow_github_oidc" {
  depends_on         = [google_iam_workload_identity_pool_provider.github_provider]
  service_account_id = google_service_account.github_actions.name
  role               = "roles/iam.workloadIdentityUser"

  members = [
    "principalSet://iam.googleapis.com/${google_iam_workload_identity_pool.github_pool.name}/attribute.repository/${var.github_repo}"
  ]
}