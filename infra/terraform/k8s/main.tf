module "cluster_access" {
  source                    = "./modules/cluster_access"
  project_id                = var.PROJECT_ID
  service_account_k8s_email = var.K8S_SERVICE_ACCOUNT_EMAIL
  service_account_k8s_name  = var.K8S_SERVICE_ACCOUNT_NAME
}

module "secrets" {
  source            = "./modules/secrets"
  database          = var.DATABASE
  username          = var.DB_USERNAME
  password          = var.DB_PASSWORD
  cluster_namespace = module.cluster_access.cluster_namespace
}