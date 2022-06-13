resource "aws_secretsmanager_secret" "secrets" {
  for_each = var.secrets_map
  name = each.key
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "AWS": "${each.value.policy.accountList[0]}"
      },
      "Action": "secretsmanager:GetSecretValue",
      "Resource": "*"
    }
  ]
}
POLICY
}
