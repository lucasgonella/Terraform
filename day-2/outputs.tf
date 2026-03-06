output "bucket_id" {
  value       = aws_s3_bucket.bucket.id
  sensitive   = true
  description = "ID do bucket S3"
  depends_on  = [aws_s3_bucket.bucket]
}

output "bucket_arn" {
  value       = aws_s3_bucket.bucket.arn
  sensitive   = true
  description = "ARN do bucket S3"
  depends_on  = [aws_s3_bucket.bucket]
}
