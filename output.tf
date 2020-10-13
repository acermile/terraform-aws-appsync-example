output "appsync-api" {
  value       = aws_appsync_graphql_api.example.uris
  description = "appsync API URL."
}
/*output "identitypoolID" {
  value       = aws_cognito_identity_pool.amnidhi-shop-identity-pool.id
  description = "identity pool ID"
}

output "userpoolID" {
  value       = aws_cognito_user_pool.amnidhishoppool.id
  description = "User pool ID"
}

output "userpoolEndpoint" {
  value       = aws_cognito_user_pool.amnidhishoppool.endpoint
  description = "identity pool Endpoint"
}

output "userpoolClientsecret" {
  value       = aws_cognito_user_pool_client.amnidhishopclient.client_secret
  description = "The client secret of the user pool client."
}

output "userpoolClientid" {
  value       = aws_cognito_user_pool_client.amnidhishopclient.id
  description = "The id of the user pool client."
} */
