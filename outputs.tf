output "bucket_name" {
  description = "作成したバケット名"
  value       = aws_s3_bucket.sample.bucket
}