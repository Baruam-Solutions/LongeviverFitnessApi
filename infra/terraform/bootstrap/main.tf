# Bucket onde é salvo o estado do terraform remotamente
module "terraform_bootstrap_state_storage" {
  source                      = "./modules/state_bucket"
  terraform_state_bucket_name = "lgv-terraform-bootstrap-state-mateus" # "${var.PROJECT_ID}-terraform-state"
}

# Artifact Registry Repository para armazenar as imagens docker
module "artifact_repository" {
  source                            = "./modules/artifact_repository"
  project_id                        = var.PROJECT_ID
  project_region                    = var.PROJECT_REGION
  artifact_registry_repository_name = var.ARTIFACT_REGISTRY_REPOSITORY_NAME
}

# Define Workload Identity Federation, Service Account do GitHub Actions, e IAM roles
module "gh_actions" {
  source                                = "./modules/gh_actions"
  project_id                            = var.PROJECT_ID
  project_region                        = var.PROJECT_REGION
  artifact_registry_repository_name     = module.artifact_repository.artifact_repository_id
  terraform_bootstrap_state_bucket_name = module.terraform_bootstrap_state_storage.bucket_name
  github_repo                           = var.GIT_REPO
  gh_pool                               = var.GIT_POOL
  gh_provider                           = var.GIT_PROVIDER
}