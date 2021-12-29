output "efs_dns_name" {
  description = "DNS name of the EFS share"
  value       = aws_efs_file_system.this.dns_name
}
output "efs_arn" {
  description = "ARN of the EFS share"
  value       = aws_efs_file_system.this.arn
}
output "efs_number_of_mount_targets" {
  description = "number of mount targets"
  value       = aws_efs_file_system.this.number_of_mount_targets
}
output "efs_id" {
  description = "EFS id, e.g. fs-ccf56dsg"
  value       = aws_efs_file_system.this.id
}
