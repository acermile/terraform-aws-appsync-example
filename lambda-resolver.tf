// lambda functiion to send the stream data to dynamoDB table created in dynamoDB.tf

resource "aws_iam_role" "iam_for_lambda_appsync" {
  name = "${var.environment}-iam_for_lambda_appsync"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": "sts:AssumeRole",
        "Principal": {
          "Service": "appsync.amazonaws.com"
        },
        "Effect": "Allow"
      }
    ]
}
EOF
}


resource "aws_iam_role_policy" "lambda_role_policy_appsync" {
  name = "${var.environment}-lambda_role_policy_appsync"
  role = aws_iam_role.iam_for_lambda_appsync.id

  policy = <<-EOF
{
      "Version": "2012-10-17",
      "Statement": [
          {
              "Effect": "Allow",
              "Action": [
                  "lambda:invokeFunction"
              ],
              "Resource": "*"
          }
      ]
}
 EOF
}


resource "aws_iam_role" "iam_for_lambda_function" {
  name = "${var.environment}-iam_for_lambda_function"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "lambda_role_policy" {
  name = "${var.environment}-lambda_role_policy"
  role = aws_iam_role.iam_for_lambda_function.id

  policy = <<-EOF
{
      "Version": "2012-10-17",
      "Statement": [
          {
              "Effect": "Allow",
              "Action": [
                  "lambda:invokeFunction"
              ],
              "Resource": "*"
          }
      ]
}
 EOF
}



resource "aws_cloudwatch_log_group" "example" {
  name              = "/aws/lambda/${aws_lambda_function.currency_convertor_lambda.function_name}"
  retention_in_days = 14
}

# See also the following AWS managed policy: AWSLambdaBasicExecutionRole
resource "aws_iam_policy" "lambda_logging_appsync" {
  name        = "${var.environment}-lambda-logging-appsync"
  path        = "/"
  description = "IAM policy for logging from a lambda"

  policy = <<EOF
{
   "Version": "2012-10-17",
   "Statement": [
     {
       "Action": [
         "logs:CreateLogGroup",
         "logs:CreateLogStream",
         "logs:PutLogEvents"
       ],
       "Resource": "arn:aws:logs:*:*:*",
       "Effect": "Allow"
     }
   ]
 }
EOF
}

resource "aws_iam_role_policy_attachment" "lambda_logs" {
  role       = aws_iam_role.iam_for_lambda_function.name
  policy_arn = aws_iam_policy.lambda_logging_appsync.arn
}

// lambda zip file creation
data "archive_file" "bundle" {
  type       = "zip"
  source_dir = "${path.module}/lambda-code"

  output_path = "${path.module}/lambda_files_bundle/lambda.zip"
}



resource "aws_lambda_function" "currency_convertor_lambda" {
  filename         = data.archive_file.bundle.output_path
  function_name    = "${var.environment}-currency-convertor"
  role             = aws_iam_role.iam_for_lambda_function.arn
  handler          = "index.handler"
  source_code_hash = data.archive_file.bundle.output_sha

  runtime = "nodejs12.x"
}


resource "aws_appsync_datasource" "currency_convertor_lambda" {
  api_id           = aws_appsync_graphql_api.example.id
  name             = "currencyConverter"
  service_role_arn = aws_iam_role.iam_for_lambda_appsync.arn
  type             = "AWS_LAMBDA"

  lambda_config {
    function_arn = aws_lambda_function.currency_convertor_lambda.arn
  }
}



resource "aws_appsync_function" "Query_getConvertedPrice_Function" {
  api_id                   = aws_appsync_graphql_api.example.id
  data_source              = aws_appsync_datasource.currency_convertor_lambda.name
  name                     = "getConvertedPrice"
  request_mapping_template = <<EOF
#**
      The value of 'payload' after the template has been evaluated
      will be passed as the event to AWS Lambda.
  *#
  {
      "version" : "2018-05-29",
      "operation": "Invoke",
      "payload": $util.toJson($context.arguments)
}
EOF

  response_mapping_template = <<EOF
## In order to retain the same execution behavior for 2017-02-28 templates
  ## you might have to uncomment the following code below.
  ## For more details about changes from 2017-02-28 to 2018-05-29 see
  ## https://docs-aws.amazon.com/appsync/latest/devguide/resolver-mapping-template-changelog.html
  ##
  ## #if($ctx.error)
  ##   $util.error($ctx.error.message, $ctx.error.type)
  ## #end
  ## #if($util.isNull($ctx.result))
  ##   #return
  ## #end

$util.toJson($context.result)
EOF
}

resource "aws_appsync_resolver" "Query_pipeline_currency" {
  type              = "Query"
  api_id            = aws_appsync_graphql_api.example.id
  field             = "getConvertedPrice"
  request_template  = "{}"
  response_template = "$util.toJson($ctx.result)"
  kind              = "PIPELINE"
  pipeline_config {
    functions = [
      aws_appsync_function.Query_getConvertedPrice_Function.function_id,
    ]
  }
}
