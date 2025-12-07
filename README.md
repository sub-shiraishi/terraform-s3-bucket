# Terraform S3 Bucket Project

このリポジトリは、Terraform を使用して **AWS S3 バケットを作成する最小構成のサンプル** です。  
Terraform 初学者がクラウドリソースを IaC（Infrastructure as Code）で管理する流れを理解することを目的としています。

---

## 構成概要

Terraform によって以下の AWS リソースを作成します：

- **S3 Bucket**
- **S3 バケットのバージョニング設定**

本プロジェクトは再利用性を重視し、変数 (`variables.tf`) を使ってバケット名やリージョンを柔軟に変更できるようにしています。

---

## 🗂 ディレクトリ構成
.
├── main.tf # S3 バケットとバージョニング設定
├── variables.tf # 入力変数の定義
├── outputs.tf # 出力値の定義
└── terraform.tfvars # 変数の値（環境ごとに変更可能）


---

## 利用技術

- **Terraform v1.14.0**
- **AWS S3**

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
| 変数名                  | 型      | デフォルト            | 説明            |
| -------------------- | ------ | ---------------- | ------------- |
| `aws_region`         | string | `ap-northeast-1` | AWS リージョン     |
| `bucket_name`        | string | なし（必須）           | 作成する S3 バケット名 |
| `versioning_enabled` | bool   | true             | バージョニングの利用有無  |

## 出力
Terraform 実行後に以下の値が表示されます：

作成した S3 バケット名