output "bucket_name" {
  description = "作成したバケット名"
  value       = aws_s3_bucket.sample.bucket
}

output "vpc_id" {
  value       = aws_vpc.main.id
  description = "VPCのID"

}

output "public_subnet_id" {
  value       = aws_subnet.public.id
  description = "パブリックサブネットID"
}
