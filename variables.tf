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

variable "project_name" {
  type        = string
  description = "リソース名のプレフィックス"
}

variable "vpc_cidr" {
  type        = string
  description = "メインVPCのCIDR"
}

variable "public_subnet_cidr" {
  type        = string
  description = "パブリックサブネットCID"
}

variable "public_subnet_az" {
  type        = string
  description = "パブリックサブネットAZ"
}

variable "private_subnet_cidr" {
  type        = string
  description = "プライベートサブネットCID"
}

variable "private_subnet_az" {
  type        = string
  description = "プライベートサブネットAZ"
}




