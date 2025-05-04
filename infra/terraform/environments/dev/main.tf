# module "rds" {
#   source              = "../../modules/rds"
#   id_project          = var.project_id
#   instance_name       = "longeviverdev"
#   database_name       = "lgv_dev"
#   database_version    = "POSTGRES_17"
#   tier                = "db-f1-micro"
#   edition             = "ENTERPRISE"
#   region              = var.project_region
#   deletion_protection = false
#   password            = "MinhaSenhaForte123!"
#   username            = "postgres"
# }
#
# module "k8s" {
#   source                   = "../../modules/k8s"
#   id_project               = var.project_id
#   cluster_name             = "longeviverfitness-cluster"
#   cluster_location         = var.project_zone
#   node_machine_type        = "e2-medium"
#   initial_node_count       = 1
#   name_node_pool           = "logeviver-dev-node-pool"
#   preemptible              = true
#   database                 = "lgv_dev"
#   password                 = "MinhaSenhaForte123!"
#   username                 = "postgres"
# }

module "artifact_repository" {
  source                   = "../../modules/artifact_repository"
  id_project               = var.project_id
  artifact_region          = var.project_region
  artifact_repository_name = "longeviverfitness-repositorio"
}

module "git_actions" {
  source = "../../modules/git_actions"
  id_project = var.project_id
  github_repo = "Baruam-Solutions/LongeviverFitnessApi"
  artifact_registry_repository_name = module.artifact_repository.artifact_repository_name
  artifact_registry_repository_region = var.project_region
}