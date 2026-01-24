resource "aws_lambda_function" "this" {
  function_name = var.lambda_name
  runtime       = "nodejs18.x"
  handler       = "index.handler"
  role          = aws_iam_role.lambda_exec.arn
  filename      = "lambda.zip"
}

resource "aws_api_gateway_rest_api" "this" {
  name = "${var.lambda_name}-api"
}

output "lambda_function_name" {
  value = aws_lambda_function.this.function_name
}
