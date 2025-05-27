module "cluster_access" {
  source                    = "./modules/cluster_access"
  project_id                = var.PROJECT_ID
  service_account_k8s_email = var.K8S_SERVICE_ACCOUNT_EMAIL
}

module "secrets" {
  source            = "./modules/secrets"
  database          = var.DATABASE
  username          = var.USERNAME
  password          = var.PASSWORD
  cluster_namespace = module.cluster_access.cluster_namespace
}