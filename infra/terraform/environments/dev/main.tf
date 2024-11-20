module "rds" {
  source              = "../../modules/rds"
  instance_name       = "longevivierdev"
  database_version    = "POSTGRES_17"
  region              = "us-central1"
  tier                = "db-f1-micro"
  database_name       = "lgv_dev"
  id-project          = var.project
  deletion_protection = false
}
