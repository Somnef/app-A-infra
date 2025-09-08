output "target_group_arn" {
	value = aws_alb_target_group.alb_tg.arn
	description = "ARN of the TG attached to the load balancer"
}

output "alb_sg_id" {
	value = aws_security_group.alb_sg.id
}

output "alb_subnet_ids" {
  value = data.aws_subnets.subnets.ids
}

output "alb_dns" {
	value = aws_alb.alb.dns_name
}