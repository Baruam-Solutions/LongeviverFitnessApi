output "db_host" {
  value = google_sql_database_instance.main.private_ip_address
}