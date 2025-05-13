# Habilita o serviço Cloud Build API no projeto
resource "google_project_service" "cloud_build" {
  project            = var.project_id
  service            = "cloudbuild.googleapis.com"
  disable_on_destroy = false
}

# Cria um repositório Docker para o projeto
resource "google_artifact_registry_repository" "docker_repo" {
  depends_on = [google_project_service.cloud_build]
  provider      = google
  project       = var.project_id
  location      = var.project_region
  repository_id = var.artifact_registry_repository_name
  format        = "DOCKER"
  description   = "Repositório Docker para o projeto ${var.project_id}"
}