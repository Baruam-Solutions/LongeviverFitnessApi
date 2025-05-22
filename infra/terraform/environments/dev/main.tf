module "rds" {
  source              = "../../modules/rds"
  id_project          = var.project_id
  instance_name       = "longeviverdev"
  database_name       = "lgv_dev"
  database_version    = "POSTGRES_17"
  tier                = "db-f1-micro"
  edition             = "ENTERPRISE"
  region              = var.project_region
  deletion_protection = false
  password            = "MinhaSenhaForte123!"
  username            = "postgres"
}

module "gke" {
  source             = "../../modules/gke"
  id_project         = var.project_id
  cluster_name       = "longeviverfitness-cluster"
  cluster_location   = var.project_zone
  node_machine_type  = "e2-medium"
  initial_node_count = 1
  name_node_pool     = "logeviver-dev-node-pool"
  preemptible        = true
  cluster_namespace  = module.k8s.cluster_namespace
  ksa_name           = module.k8s.ksa_name
}

module "k8s" {
  source                    = "../../modules/k8s"
  id_project                = var.project_id
  database                  = "lgv_dev"
  password                  = "MinhaSenhaForte123!"
  username                  = "postgres"
  cluster_name              = module.gke.cluster_name
  service_account_k8s_email = module.gke.service_account_k8s_email
}