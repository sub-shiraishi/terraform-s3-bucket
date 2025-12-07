variable "aws_region" {
  type        = string
  default     = "ap-northeast-1"
  description = "AWSのリージョン"
}

variable "bucket_name" {
  description = "作成するS3バケットの名前"
  type        = string
}

variable "environment" {
  type        = string
  default     = "dev"
  description = "環境名（dev / stg / prod）"
}


variable "versioning_enabled" {
  description = "バージョニングの有効化"
  type        = bool
  default     = true
}

variable "iam_username" {
  type        = string
  description = "IAM ユーザー名"
}

variable "iam_group_name" {
  type        = string
  description = "IAM グループ名"
}

variable "iam_policy_name" {
  type        = string
  description = "IAM　ポリシー名"
}

