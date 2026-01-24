# Rol IAM para que la Lambda pueda ejecutarse (Free Tier)
resource "aws_iam_role" "lambda_exec" {
  name = "${var.lambda_name}-exec-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

# Adjuntar política básica de logs (Free Tier: CloudWatch Logs)
resource "aws_iam_role_policy_attachment" "lambda_logs" {
  role       = aws_iam_role.lambda_exec.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

# Función Lambda (Free Tier: 1 millón de invocaciones/mes gratis)
resource "aws_lambda_function" "this" {
  function_name = var.lambda_name
  runtime       = "python3.9"
  handler       = "index.handler"
  role          = aws_iam_role.lambda_exec.arn
  filename      = "${path.module}/lambda.zip"
}

# API Gateway (Free Tier: 1 millón de llamadas/mes gratis)
resource "aws_api_gateway_rest_api" "this" {
  name = "${var.lambda_name}-api"
}
