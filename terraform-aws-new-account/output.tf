# outputs.tf

output "new_account_id" {
  description = "The ID of the new AWS account."
  value       = aws_organizations_account.new_account.id
}

output "admin_role_arn" {
  description = "The ARN of the admin role."
  value       = aws_iam_role.admin_role.arn
}

output "switch_role_arn" {
  description = "The ARN of the switch role."
  value       = aws_iam_role.switch_role.arn
}

output "new_instance_id" {
  description = "The ID of the new instance."
  value       = aws_instance.new_instance.id
}

