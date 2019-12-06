output "efs_dns_name" {
  description = "DNS name of the EFS share"
  value       = aws_efs_file_system.this.dns_name
}

