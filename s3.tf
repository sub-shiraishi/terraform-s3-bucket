#S3 backet作成
resource "aws_s3_bucket" "sample" {
  bucket = var.bucket_name

  tags = {
    Name        = var.bucket_name
    Environment = var.environment
  }
}

#バージョニング設定
resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.sample.id
  versioning_configuration {
    status = var.versioning_enabled ? "Enabled" : "Suspended"
  }
}

#暗号化設定
resource "aws_s3_bucket_server_side_encryption_configuration" "encryption" {
  bucket = aws_s3_bucket.sample.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

#パブリックブロックアクセス
resource "aws_s3_bucket_public_access_block" "block" {
  bucket = aws_s3_bucket.sample.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true


}