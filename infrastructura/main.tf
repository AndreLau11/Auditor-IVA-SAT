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

resource "aws_cloudfront_distribution" "website_distribution" {
  # Bloque mínimo para que Terraform reconozca el recurso
  enabled = true

  origin {
    domain_name = "plataforma-de-contabilidad.s3.amazonaws.com"
    origin_id   = "S3-plataforma-de-contabilidad"
  }

  default_cache_behavior {
    target_origin_id       = "S3-plataforma-de-contabilidad"
    viewer_protocol_policy = "allow-all"

    allowed_methods = ["GET", "HEAD"]
    cached_methods  = ["GET", "HEAD"]

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }
}
resource "aws_cloudfront_origin_access_control" "oac" {
  name                              = "OAC-plataforma-de-contabilidad"
  description                       = "OAC para acceso seguro desde CloudFront"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}
resource "aws_s3_bucket" "website_bucket" {
  bucket = "plataforma-de-contabilidad"
}
