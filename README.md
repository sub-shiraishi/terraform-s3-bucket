# Terraform S3 Bucket & IAM Project

このリポジトリは、Terraform を利用して  
**AWS S3 バケット** および **IAM（最小権限ユーザー）構成** を作成するサンプルプロジェクトです。

Terraform 初学者がクラウドリソースを IaC（Infrastructure as Code）で管理する流れを理解することを目的としています。

---

## 構成概要

Terraform によって以下の AWS リソースを作成します：

###  STEP1：S3
- S3 Bucket
- S3 バケットのバージョニング設定

###  STEP2：IAM（最小権限ユーザー）
- IAM User（CLI 用など軽い用途を想定）
- IAM Group
- カスタム IAM Policy（S3 読み取りのみ許可の最小権限）
- Group にポリシーをアタッチ
- User を Group に所属させる

本プロジェクトは再利用性を重視し、  
変数（`variables.tf` / `terraform.tfvars`）を使ってバケット名や IAM 名を柔軟に変更できるようにしています。

---
## ディレクトリ構成
.
├── main.tf # S3 バケット構成
├── iam.tf # IAM（ユーザー/グループ/ポリシー）
├── variables.tf # 入力変数の定義
├── outputs.tf # 出力値の定義
└── terraform.tfvars # 変数の値（環境ごとに変更）

---

## 利用技術

- **Terraform v1.14.0**
- **AWS S3/IAM**

---

## 使い方

### 1. 初期化

AWS 認証情報（環境変数 or ~/.aws/credentials）を設定した状態で以下を実行します。
terraform init

### 2. 設定内容の確認
terraform plan

### 3. 適用（作成）
terraform apply

## 入力変数（variables）
### S3
| 変数名                  | 型      | デフォルト            | 説明            |
| -------------------- | ------ | ---------------- | ------------- |
| `aws_region`         | string | `ap-northeast-1` | AWS リージョン     |
| `bucket_name`        | string | なし（必須）           | 作成する S3 バケット名 |
| `versioning_enabled` | bool   | true             | バージョニングの利用有無  |

### IAM
| 変数名             | 型      | 説明 |
|------------------|---------|------|
| `iam_username`    | string | 作成する IAM ユーザー名 |
| `iam_group_name`  | string | IAM グループ名 |
| `iam_policy_name` | string | カスタム IAM ポリシー名 |

## 出力
Terraform 実行後に以下の値が表示されます：

- 作成した S3 バケット名
- IAM ユーザー ARN
- IAM グループ ARN
- カスタムポリシー ARN