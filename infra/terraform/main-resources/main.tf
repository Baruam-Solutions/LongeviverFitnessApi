module "rds" {
  source              = "./modules/rds"
  project_id          = var.PROJECT_ID
  region              = var.PROJECT_REGION
  instance_name       = var.DB_INSTANCE_NAME
  database_name       = var.DATABASE
  username            = var.DB_USERNAME
  password            = var.DB_PASSWORD
  deletion_protection = var.DB_DELETION_PROTECTION
  database_version    = var.DB_VERSION
  tier                = var.DB_TIER
  edition             = var.DB_EDITION
}

module "gke" {
  source                     = "./modules/gke"
  project_id                 = var.PROJECT_ID
  cluster_location           = var.PROJECT_ZONE
  cluster_name               = var.GKE_CLUSTER_NAME
  node_machine_type          = var.GKE_NODE_MACHINE_TYPE
  initial_node_count         = var.GKE_INITIAL_NODE_COUNT
  name_node_pool             = var.GKE_NODE_POOL_NAME
  preemptible                = var.GKE_PREEMPTIBLE
  gh_actions_service_account_email = var.GH_ACTIONS_SERVICE_ACCOUNT_EMAIL
}