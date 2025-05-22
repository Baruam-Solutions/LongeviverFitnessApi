module "rds" {
  source              = "../modules/rds"
  id_project          = var.PROJECT_ID
  instance_name       = "longeviverdev"
  database_name       = "lgv_dev"
  database_version    = "POSTGRES_17"
  tier                = "db-f1-micro"
  edition             = "ENTERPRISE"
  region              = var.PROJECT_REGION
  deletion_protection = false
  password            = "MinhaSenhaForte123!"
  username            = "postgres"
}