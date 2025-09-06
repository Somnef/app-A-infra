output "bastion_ip" {
  value = module.ec2.bastion_ip
  description = "Public IP address of the bastion host"
}

output "instances_ips" {
	value = module.ec2.instance_ips
	description = "Private IP addresses of the server instances"
}