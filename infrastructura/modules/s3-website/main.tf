resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name

  website {
    index_document = "index.html"
    error_document = "error.html"
  }
}

output "bucket_id" {
  value = aws_s3_bucket.this.id
}
