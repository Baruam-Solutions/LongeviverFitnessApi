output "bucket_name" {
  value = google_storage_bucket.terraform_state.name
  description = "Nome do cloud storage bucket para armazenar terraform state"
}