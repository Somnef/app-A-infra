variable "vpc_id" {
	type = string
	default = ""
	description = "VPC ID to deploy the resources into. Default region VPC if empty."
}

variable "public_subnet_ids" {
	type = list(string)
	default = [ ]
	description = "Subnets IDs to deploy the instances into"
}

variable "private_subnet_ids" {
	type = list(string)
	default = [ ]
	description = "Subnets IDs to deploy the instances into"
}

variable "alb_sg_id" {
	type = string
	default = ""
}

variable "instance_count" {
	type = number
	default = 3
	description = "Number of instances to spawn"
}

variable "use_bastion" {
	type = bool
	default = false
	description = "Set to true to spawn a bastion host"
}