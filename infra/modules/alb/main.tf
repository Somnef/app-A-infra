terraform {
	required_providers {
		aws = {
			source = "hashicorp/aws"
			version = "~> 6.0"
		}
	}
}

provider "aws" {
	region = "eu-west-3"
}

resource "aws_alb" "alb" {
	name = var.app_name == "" ? "alb" : "${var.app_name}-alb"
	internal = false
	load_balancer_type = "application"

	security_groups = [aws_security_group.alb_sg.id]
	subnets = var.subnet_ids == [] ? data.aws_subnets.subnets.ids : var.subnet_ids
}

resource "aws_alb_listener" "alb_listener" {
	load_balancer_arn = aws_alb.alb.arn
	port = "80"
	protocol = "HTTP"

	dynamic "default_action" {
		for_each = var.use_fixed_response ? [1] : []

		content {
			type = "fixed-response"
			fixed_response {
				content_type = "text/plain"
				message_body = "Load-balancer working. This is a fixed response"
				status_code = 200
			}
		}
	
	}
	dynamic "default_action" {
		for_each = var.use_fixed_response ? [0] : [1]

		content {
			type = "forward"
			target_group_arn = aws_alb_target_group.alb_tg.arn
		}
	}
}

resource "aws_alb_target_group" "alb_tg" {
	name = var.app_name == "" ? "alb-tg" : "${var.app_name}-alb-tg"
	vpc_id = var.vpc_id == "" ? data.aws_vpc.default_vpc.id : var.vpc_id
	port = var.target_port
	protocol = var.target_protocol
}

