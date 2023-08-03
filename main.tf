resource "aws_iam_instance_profile" "ec2_profile" {
  name = var.profile_name
  role = aws_iam_role.iam_role.name
    lifecycle {
    ignore_changes = [tags]
  }
}
resource "aws_iam_role" "iam_role" {
  name = var.role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = var.service
        }
      },
    ]
  })
    lifecycle {
    ignore_changes = [tags]
  }
}
resource "aws_iam_policy" "policy" {
  name        = var.policy_name
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = var.policy_action
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
    lifecycle {
    ignore_changes = [tags]
  }
}
resource "aws_iam_policy_attachment" "test-attach" {
  name       =   var.policy_attachment_name
  roles       = [aws_iam_role.iam_role.name]
  policy_arn = aws_iam_policy.policy.arn
}