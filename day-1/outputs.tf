output "bucket_domain_name" {
  value       = aws_s3_bucket.bucket.bucket_domain_name
  sensitive   = true
  description = "Nome de domínio do bucket S3"
  depends_on  = [aws_s3_bucket.bucket]
}

output "arn" {
  value       = aws_s3_bucket.bucket.arn
  sensitive   = true
  description = "ARN do bucket S3"
  depends_on  = [aws_s3_bucket.bucket]
}

