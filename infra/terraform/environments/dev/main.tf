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

module "k8s" {
  id_project               = var.project
  source                   = "../../modules/k8s"
  cluster_name             = "longeviverfitness-cluster"
  cluster_location         = "southamerica-east1-a"
  node_machine_type        = "e2-medium"
  initial_node_count       = 1
  artifact_region          = "southamerica-east1"
  artifact_repository_name = "longeviverfitness-repositorio"
  name_node_pool           = "logeviver-dev-node-pool"
  preemptible              = true
}