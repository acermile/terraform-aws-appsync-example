/*resource "aws_cognito_user_pool" "amnidhishoppool" {
  name = "amnidhi-shop-pool"

  //  alias_attributes = ["email"]
}

resource "aws_cognito_user_pool_client" "amnidhishopclient" {
  name = "amnidhi-shop-client"

  user_pool_id    = aws_cognito_user_pool.amnidhishoppool.id
  generate_secret = true
}

resource "aws_cognito_identity_pool" "amnidhi-shop-identity-pool" {
  identity_pool_name               = "amnidhishopidentitypool"
  allow_unauthenticated_identities = false
} */
