variable "aws_region" {
  type        = string
  default     = "ap-northeast-1"
  description = "AWSのリージョン"
}

variable "bucket_name" {
  description = "作成するS3バケットの名前"
  type        = string
}

variable "versioning_enabled" {
  description = "バージョニングの有効化"
  type        = bool
  default     = true
}