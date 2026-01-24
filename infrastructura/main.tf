module "s3_website" {
  source      = "./modules/s3-website"
  bucket_name = var.bucket_name
}

module "lambda_api" {
  source       = "./modules/lambda-api"
  lambda_name  = var.lambda_name
}

module "dynamodb_table" {
  source      = "./modules/dynamodb-table"
  table_name  = var.table_name
}

module "monitoring" {
  source = "./modules/monitoring"
}
