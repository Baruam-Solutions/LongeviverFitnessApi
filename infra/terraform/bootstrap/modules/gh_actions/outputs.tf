output "gh_actions_service_account_email" {
  value = google_service_account.github_actions.email
  description = "Email da Service Account do GitHub Actions"
}