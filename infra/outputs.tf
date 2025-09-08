output "bastion_ip" {
  value = module.ec2.bastion_ip
  description = "Public IP address of the bastion host"
}

output "instance_ips" {
	value = module.ec2.instance_ips
	description = "Private IP addresses of the server instances"
}

output "alb_dns" {
	value = module.alb.alb_dns
	description = "DNS of the ALB"
}