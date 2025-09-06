output "instance_ids" {
	value = aws_instance.instances[*].id
}

output "bastion_ip" {
  value = var.use_bastion ? aws_instance.bastion[0].public_ip : null
  description = "Public IP address of the bastion host"
}

output "instance_ips" {
	value = aws_instance.instances[*].private_ip
	description = "Private IP addresses of the server instances"
}