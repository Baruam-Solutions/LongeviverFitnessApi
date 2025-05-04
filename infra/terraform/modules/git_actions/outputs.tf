output "pool_name" {
  value = google_iam_workload_identity_pool.github_pool.name
}

output "pool_provider_id" {
  value = google_iam_workload_identity_pool_provider.github_provider.id
}

output "pool_provider_name" {
  value = google_iam_workload_identity_pool_provider.github_provider.name
}

output "github_actions_service_account_email" {
  value = google_service_account.github_actions.email
}