## AWS Appsync API with terraform

### Overview

### Provides Appsync API using API_KEY with Schema , VLT templates

### Provides an AppSync DataSource of DynamoDB, HTTP and AWS Lambda

### Provides an AppSync Function

### Provides an Appsync Resolver


### Terraform resources :

data.archive_file.bundle: Refreshing state...

aws_iam_policy.lambda_logging_appsync: Refreshing state... [id=arn:aws:iam::942960519349:policy/uat-lambda-logging-appsync]


aws_iam_role.address: Refreshing state... [id=address]

aws_iam_role.Users: Refreshing state... [id=Users]

aws_iam_role.favorites: Refreshing state... [id=favorites]

aws_dynamodb_table.Users: Refreshing state... [id=amnidhi-shop-users]

aws_dynamodb_table.favorites: Refreshing state... [id=favorites]

aws_appsync_graphql_api.example: Refreshing state... [id=e2flqlkxsfheph6bpmj3i576jy]

aws_iam_role.iam_for_lambda_function: Refreshing state... [id=uat-iam_for_lambda_function]

aws_iam_role.iam_for_lambda_appsync: Refreshing state... [id=uat-iam_for_lambda_appsync]

aws_dynamodb_table.address: Refreshing state... [id=address]

aws_appsync_datasource.example: Refreshing state... [id=e2flqlkxsfheph6bpmj3i576jy-apiendpoint]

aws_iam_role_policy.lambda_role_policy: Refreshing state... [id=uat-iam_for_lambda_function:uat-lambda_role_policy]

aws_lambda_function.currency_convertor_lambda: Refreshing state... [id=uat-currency-convertor]

aws_iam_role_policy.lambda_role_policy_appsync: Refreshing state... [id=uat-iam_for_lambda_appsync:uat-lambda_role_policy_appsync]


aws_appsync_function.test1: Refreshing state... [id=e2flqlkxsfheph6bpmj3i576jy-bmy36uxcebbvjbseyr3uyfyonm]

aws_appsync_function.test2: Refreshing state... [id=e2flqlkxsfheph6bpmj3i576jy-3bv5pav3ffeezjz4lznwk4s4gq]


aws_appsync_resolver.Query_pipelineTest1: Refreshing state... [id=e2flqlkxsfheph6bpmj3i576jy-Query-getCategories]


aws_appsync_resolver.Query_pipelineTest: Refreshing state... [id=e2flqlkxsfheph6bpmj3i576jy-Query-getProductsbyTaxonomyID]


aws_iam_role_policy_attachment.lambda_logs: Refreshing state... [id=uat-iam_for_lambda_function-20201012173910859000000001]


aws_cloudwatch_log_group.example: Refreshing state... [id=/aws/lambda/uat-currency-convertor]


aws_appsync_datasource.currency_convertor_lambda: Refreshing state... [id=e2flqlkxsfheph6bpmj3i576jy-currencyConverter]


aws_appsync_function.Query_getConvertedPrice_Function: Refreshing state... [id=e2flqlkxsfheph6bpmj3i576jy-l3dfmlcq35gtdc5qua3clp4ysi]


aws_iam_role_policy.Users: Refreshing state... [id=Users:Users]


aws_appsync_datasource.user-dynamodb: Refreshing state... [id=e2flqlkxsfheph6bpmj3i576jy-User]


aws_appsync_datasource.favorites-dynamodb: Refreshing state... [id=e2flqlkxsfheph6bpmj3i576jy-favorites]


aws_iam_role_policy.favorites: Refreshing state... [id=favorites:favorites]


aws_iam_role_policy.address: Refreshing state... [id=address:address]

aws_appsync_datasource.address-dynamodb: Refreshing state... [id=e2flqlkxsfheph6bpmj3i576jy-address]

aws_appsync_resolver.Query_pipeline_currency: Refreshing state... [id=e2flqlkxsfheph6bpmj3i576jy-Query-getConvertedPrice]

aws_appsync_function.deleteFavorite: Refreshing state... [id=e2flqlkxsfheph6bpmj3i576jy-isi6brp6x5f3xcx5sfuvb7swcm]

aws_appsync_function.getFavoritesbyUser: Refreshing state... [id=e2flqlkxsfheph6bpmj3i576jy-q7o5kmgtsveyhdbxpgikyj54be]

aws_appsync_function.Mutation_addFavorite_Function: Refreshing state... [id=e2flqlkxsfheph6bpmj3i576jy-z6zazufrgfadtf6gsd2br7mrle]

aws_appsync_function.getAddressbyUserID: Refreshing state... [id=e2flqlkxsfheph6bpmj3i576jy-fqvb32663zby5aydhvbg27dbw4]

aws_appsync_function.addAddress: Refreshing state... [id=e2flqlkxsfheph6bpmj3i576jy-m7hgr4v23bcyxe5yg3lbv7m2tq]

aws_appsync_function.mutation_user: Refreshing state... [id=e2flqlkxsfheph6bpmj3i576jy-cbh6pco2wzcz7csyae5i2wfsam]

aws_appsync_function.getUserbyEmail: Refreshing state... [id=e2flqlkxsfheph6bpmj3i576jy-pys4pzvuivefvo7kvw246cizga]

aws_appsync_resolver.Mutation_addAddress: Refreshing state... [id=e2flqlkxsfheph6bpmj3i576jy-Mutation-addAddress]

aws_appsync_resolver.getFavorite: Refreshing state... [id=e2flqlkxsfheph6bpmj3i576jy-Query-getFavorite]

aws_appsync_resolver.Mutation_deleteFavorite: Refreshing state... [id=e2flqlkxsfheph6bpmj3i576jy-Mutation-deleteFavorite]

aws_appsync_resolver.Mutation_addFavorite: Refreshing state... [id=e2flqlkxsfheph6bpmj3i576jy-Mutation-addFavorite]

aws_appsync_resolver.getAddressbyUserID: Refreshing state... [id=e2flqlkxsfheph6bpmj3i576jy-Query-getAddress]

aws_appsync_resolver.getUserbyEmail: Refreshing state... [id=e2flqlkxsfheph6bpmj3i576jy-Query-getUser]

aws_appsync_resolver.Mutation_addUser: Refreshing state... [id=e2flqlkxsfheph6bpmj3i576jy-Mutation-addUser]
