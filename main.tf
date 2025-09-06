terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

	backend "s3" { }
}

provider "aws" {
  region = "eu-west-3"
}

module "vpc" {
  source = "./modules/vpc"
}

module "alb" {
  source = "./modules/alb"

  app_name           = "ecs-app"
  use_fixed_response = false

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.public_subnet_ids

  listener_port = var.alb_listener_port
  target_port   = var.target_group_port
}

module "ec2" {
  source = "./modules/ec2"

  vpc_id             = module.vpc.vpc_id
  public_subnet_ids  = module.vpc.public_subnet_ids
  private_subnet_ids = module.vpc.private_subnet_ids

  alb_sg_id = module.alb.alb_sg_id
}

resource "aws_alb_target_group_attachment" "name" {
  count = length(module.ec2.instance_ids)

  target_group_arn = module.alb.target_group_arn
  target_id        = module.ec2.instance_ids[count.index]
  port             = var.target_group_port
}

