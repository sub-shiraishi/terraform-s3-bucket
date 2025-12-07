#S3 backet作成
resource "aws_s3_bucket" "sample" {
  bucket = var.bucket_name
}

#バージョニング設定
resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.sample.id
  versioning_configuration {
    status = var.versioning_enabled ? "Enabled" : "Suspended"
  }
}

