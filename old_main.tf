# terraform {
#   required_providers {
#     aws = { source = "hashicorp/aws", version = "5.17.0" }
#   }
# }

# provider "aws" {
#   profile = "default"
#   region  = "eu-west-1"
# }

# # --- DATA --- #

# data "aws_vpc" "default" {
#   default = true
# }

# data "aws_subnets" "default_public" {
#   filter {
#     name   = "vpc-id"
#     values = [data.aws_vpc.default.id]
#   }
# }


# data "aws_availability_zones" "azs_available" {
# 	state = "available"
# }

# data "aws_iam_policy_document" "ecs_assume" {
# 	statement {
# 		actions = ["sts:AssumeRole"]
# 		principals {
# 			type = "Service"
# 			identifiers = ["ecs-tasks.amazonaws.com"]
# 		}
# 	}
# }

# data "aws_iam_policy_document" "ec2_assume" {
# 	statement {
# 		actions = ["sts:AssumeRole"]
# 		principals {
# 			type = "Service"
# 			identifiers = ["ec2.amazonaws.com"]
# 		}
# 	}
# }

# data "aws_ssm_parameter" "ecs_ami" {
#   name = "/aws/service/ecs/optimized-ami/amazon-linux-2/recommended/image_id"
# }

# # --- RESOURCES --- #

# resource "aws_ecs_cluster" "app_cluster" {
# 	name = "app-cluster"
# }

# resource "aws_iam_role" "task_execution_role" {
# 	name = "ecs-task-execution-role"
# 	assume_role_policy = data.aws_iam_policy_document.ecs_assume.json
# }

# resource "aws_iam_role_policy_attachment" "task_exec_attach" {
# 	role = aws_iam_role.task_execution_role.name
# 	policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
# }

# resource "aws_iam_role" "task_role" {
# 	name = "ecs-task-role"
# 	assume_role_policy = data.aws_iam_policy_document.ecs_assume.json
# }

# resource "aws_ecs_task_definition" "app_task_def" {
# 	family = "app-task-def"
# 	task_role_arn = aws_iam_role.task_role.arn
# 	execution_role_arn = aws_iam_role.task_execution_role.arn

# 	container_definitions = jsonencode([
# 		{
# 			name = "app-container"
# 			image = "httpd:alpine3.22"
# 			cpu = 256
# 			memory = 256
# 			essential = true
# 			portMappings = [
# 				{
# 					containerPort = 80
# 					hostPort = 80
# 				}
# 			]
# 		}
# 	])

# 	placement_constraints {
# 		type = "memberOf"
# 		# expression = "attribute:ecs.availability-zone in ${jsonencode(slice(data.aws_availability_zones.azs_available.names, 0, 2))}"
# 		expression = "attribute:ecs.availability-zone in [eu-west-1a, eu-west-1b]"
# 	}
# }

# resource "aws_ecs_service" "app" {
# 	name = "app"
# 	cluster = aws_ecs_cluster.app_cluster.id
# 	task_definition = aws_ecs_task_definition.app_task_def.arn
# 	desired_count = 1

# 	force_new_deployment = true

# 	capacity_provider_strategy {
# 		capacity_provider = aws_ecs_capacity_provider.ec2_asg_cp.name
# 		weight = 1
# 	}
# }

# resource "aws_security_group" "ec2-sg" {
# 	name = "ec2-ecs-sg"

# 	ingress {
# 		from_port = 80
# 		to_port = 80
# 		protocol = "tcp"
# 		cidr_blocks = ["0.0.0.0/0"]
# 	}

# 	ingress {
# 		from_port = 22
# 		to_port = 22
# 		protocol = "tcp"
# 		cidr_blocks = ["0.0.0.0/0"]
# 	}

# 	egress {
# 		from_port = 0
# 		to_port = 0
# 		protocol = "-1"
# 		cidr_blocks = ["0.0.0.0/0"]
# 	}
# }

# resource "aws_iam_role" "ecs_instance_role" {
# 	name = "ecs-instance-role"
# 	assume_role_policy = data.aws_iam_policy_document.ec2_assume.json
# }

# resource "aws_iam_role_policy_attachment" "ecs_instance_role_attach" {
# 	role = aws_iam_role.ecs_instance_role.name
# 	policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
# }

# resource "aws_iam_instance_profile" "ecs_instance_profile" {
# 	name = "ecs-instance-profile"
# 	role = aws_iam_role.ecs_instance_role.name
# }

# resource "aws_launch_template" "ec2_ecs_launch_template" {
# 	name_prefix = "ecs-"
# 	image_id = data.aws_ssm_parameter.ecs_ami.value
# 	instance_type = "t2.micro"

# 	vpc_security_group_ids = [aws_security_group.ec2-sg.id]

# 	key_name = aws_key_pair.access_key.key_name

# 	user_data = base64encode(<<EOF
# #!/bin/bash
# echo ECS_CLUSTER=${aws_ecs_cluster.app_cluster.name} >> /etc/ecs/ecs.config
# EOF
# )

# 	iam_instance_profile {
# 		name = aws_iam_instance_profile.ecs_instance_profile.name
# 	}
# }

# resource "aws_autoscaling_group" "ecs_asg" {
# 	desired_capacity = 1
# 	max_size = 6
# 	min_size = 1
# 	vpc_zone_identifier = data.aws_subnets.default_public.ids

# 	# protect_from_scale_in = true

# 	launch_template {
# 		id = aws_launch_template.ec2_ecs_launch_template.id
# 		version = "$Latest"
# 	}
# }

# resource "aws_ecs_capacity_provider" "ec2_asg_cp" {
# 	name = "ec2-asg-cp"
# 	auto_scaling_group_provider {
# 		auto_scaling_group_arn = aws_autoscaling_group.ecs_asg.arn
# 		# managed_termination_protection = "ENABLED"
# 	}
# }

# resource "aws_ecs_cluster_capacity_providers" "default" {
# 	cluster_name = aws_ecs_cluster.app_cluster.name
# 	capacity_providers = [aws_ecs_capacity_provider.ec2_asg_cp.name]
# }

# resource "aws_key_pair" "access_key" {
#   key_name   = "key"
#   public_key = file("~/.ssh/id_rsa.pub")
# }