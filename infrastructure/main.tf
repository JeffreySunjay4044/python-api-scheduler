data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

//resource "aws_iam_role_policy_attachment" "lambda_sqs_access" {
//  policy_arn = "arn:aws:iam::aws:policy/AmazonSQSFullAccess"
//  role       = aws_iam_role.ebconsumer.name
//}

resource "aws_iam_role" "restapi" {
  name               = "Rest api"
  assume_role_policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [{
        "Effect": "Allow",
        "Principal": {
            "Service": "lambda.amazonaws.com"
        },
        "Action": "sts:AssumeRole"
    }]
}
POLICY
}


resource "aws_iam_role_policy_attachment" "bedap-nonprod-api-task-role_policy_attachment" {
  role       = var.api_role
  policy_arn = "arn:aws:iam::aws:policy/AWSLambda_FullAccess"
}

resource "aws_lambda_function" "consume_from_eb" {
  function_name = "rest-api"
  role          = aws_iam_role.restapi.arn
  image_uri     = var.image_uri
  package_type  = "Image"
  timeout       = 60
  handler       = "main.persist_redshit"
  runtime       = "python3.9"
}






// KMS encrypt cloudwatch log group resource