resource "aws_iam_role_policy" "s3_access_policy" {
  name = "s3_access_policy"
  role = aws_iam_role.s3_access_role.id

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:Describe*",
          "s3ReadOnlyAccess:*",
          "s3:ListBucket"
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

resource "aws_iam_role" "s3_access_role" {
  name = "s3_access_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_instance_profile" "s3_access_profile" {
  role = aws_iam_role.s3_access_role.name
  name = "s3_access_role_profile"
  
}