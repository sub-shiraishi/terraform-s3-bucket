#IAM Group
resource "aws_iam_group" "group" {
  name = var.iam_group_name
}

#IAM Policy
resource "aws_iam_policy" "policy" {
  name        = var.iam_policy_name
  description = "最小限のIAMポリシー"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:ListAllMyBuckets"
        ]
        Resource = "*"
      },
      {
        Effect = "Allow"
        Action = [
          "s3:GetObject",
          "s3:ListBucket"
        ]
        Resource = [
          "arn:aws:s3:::${var.bucket_name}",
          "arn:aws:s3:::${var.bucket_name}/*"
        ]
      }
    ]
  })
}

#Policy→Groupにアタッチ
resource "aws_iam_group_policy_attachment" "attach" {
  group      = aws_iam_group.group.name
  policy_arn = aws_iam_policy.policy.arn
}

#IAM User
resource "aws_iam_user" "user" {
  name = var.iam_username
}

#User→Groupに所属
resource "aws_iam_user_group_membership" "membership" {
  user = aws_iam_user.user.name
  groups = [
    aws_iam_group.group.name
  ]
}