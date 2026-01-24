output "s3_bucket_name" {
  value = module.s3_website.bucket_id
}

output "lambda_function_name" {
  value = module.lambda_api.lambda_function_name
}

output "dynamodb_table_name" {
  value = module.dynamodb_table.dynamodb_table_id
}
