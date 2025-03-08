# Habilita o serviço Cloud Build API no projeto
resource "google_project_service" "cloud_build" {
  project            = var.id_project
  service            = "cloudbuild.googleapis.com"
  disable_on_destroy = false
}

# Cria um repositório Docker para o projeto
resource "google_artifact_registry_repository" "docker_repo" {
  depends_on = [google_project_service.cloud_build]
  provider      = google
  project       = var.id_project
  repository_id = var.artifact_repository_name
  location      = var.artifact_region
  format        = "DOCKER"
  description   = "Repositório Docker para o projeto ${var.id_project}"
}