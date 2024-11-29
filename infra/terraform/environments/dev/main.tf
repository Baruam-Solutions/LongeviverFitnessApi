module "rds" {
  source              = "../../modules/rds"
  instance_name       = "longevivierdev"
  database_name       = "lgv_dev"
  database_version    = "POSTGRES_17"
  tier                = "db-f1-micro"
  edition             = "ENTERPRISE"
  region              = "us-central1"
  id-project          = var.project-id
  deletion_protection = false
}