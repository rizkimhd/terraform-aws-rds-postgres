output "address" {
  description = "The address of the RDS instance"
  value       = aws_db_instance.this.address
}

output "arn" {
  description = "The ARN of the RDS instance"
  value       = aws_db_instance.this.arn
}

output "endpoint" {
  description = "The connection endpoint"
  value       = aws_db_instance.this.endpoint
}

output "hosted_zone_id" {
  description = "The canonical hosted zone ID of the DB instance (to be used in a Route 53 Alias record)"
  value       = aws_db_instance.this.hosted_zone_id
}

output "id" {
  description = "The RDS instance ID"
  value       = aws_db_instance.this.id
}

output "resource_id" {
  description = "The RDS Resource ID of this instance"
  value       = aws_db_instance.this.resource_id
}

output "availability_zone" {
  description = "The availability zone of the instance"
  value       = aws_db_instance.this.availability_zone
}

output "password" {
  description = "The password for the DB"
  value       = local.password
}

output "org_backup_policy" {
  description = "The value of OrgAWSBackup"
  value       = local.org_backup_policy

  precondition {
    condition     = local.is_valid_backup_policy && contains(local.available_backup_policies, local.org_backup_policy)
    error_message = "Invalid OrgAWSBackup ${local.org_backup_policy} for ${var.environment} environment"
  }
}

output "org_backup_available_policies" {
  description = "The available options for OrgAWSBackup value"
  value       = local.available_backup_policies

  precondition {
    condition     = local.is_policy_available
    error_message = "Invalid OrgAWSBackup ${local.org_backup_policy} value, available options are ${join(", ", local.available_backup_policies)}"
  }
}
