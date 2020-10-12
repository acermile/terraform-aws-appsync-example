output "appsync-api" {
  value       = aws_appsync_graphql_api.example.url
  description = "appsync API URL."
}
