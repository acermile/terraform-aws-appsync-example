output "appsync-api" {
  value       = aws_appsync_graphql_api.example.uris
  description = "appsync API URL."
}
