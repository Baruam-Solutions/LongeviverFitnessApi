# APIs e serviços para utilizar Cloud Sql
resource "google_project_service" "compute" {
  project            = var.id_project
  service            = "compute.googleapis.com"
  disable_on_destroy = false
}

# APIs e serviços para acessar base de dados por proxy
resource "google_project_service" "sqladmin" {
  project            = var.id_project
  service            = "sqladmin.googleapis.com"
  disable_on_destroy = false
}

resource "time_sleep" "espera_30_seconds" {
  depends_on = [google_project_service.compute, google_project_service.sqladmin]
  create_duration = "30s"
}

# recurso que cria nova instancia de base postgres
resource "google_sql_database_instance" "main" {
  name                = var.instance_name
  database_version    = var.database_version
  region              = var.region
  deletion_protection = var.deletion_protection

  settings {
    tier    = var.tier
    edition = var.edition
    ip_configuration {
      # ssl_mode = "TRUSTED_CLIENT_CERTIFICATE_REQUIRED" TODO - Teste
      ssl_mode = "ALLOW_UNENCRYPTED_AND_ENCRYPTED"
    }
    password_validation_policy {
      min_length                  = 6
      reuse_interval              = 2
      complexity                  = "COMPLEXITY_DEFAULT"
      disallow_username_substring = true
      password_change_interval    = "30s"
      enable_password_policy      = true
    }
  }

  depends_on = [time_sleep.espera_30_seconds]
}

# cria base de dados
resource "google_sql_database" "database" {
  name     = var.database_name
  instance = google_sql_database_instance.main.name

  depends_on = [google_sql_database_instance.main]
}

# CRIAÇÃO DE NOVA SERVICE ACCOUNT PARA ACESSAR BASE VIA PROXY

# utilizado para buscar informações do projeto
data "google_project" "project" {}

# cria service account para cloud sql
resource "google_service_account" "service_account_sql" {
  account_id   = "sql-service-account"
  display_name = "Service Account para CloudSQL"
}

# da permissão client sql para service account
resource "google_project_iam_member" "client_cloud_sql" {
  project = data.google_project.project.id
  role    = "roles/cloudsql.client"
  member  = "serviceAccount:${google_service_account.service_account_sql.email}"

  depends_on = [google_service_account.service_account_sql]
}

# TODO - Usando para teste
# cria um usuário para acessar o sql
resource "google_sql_user" "postgres_user" {
  name     = "postgres"
  instance = google_sql_database_instance.main.name
  password = var.password

  depends_on = [google_sql_database_instance.main]
}