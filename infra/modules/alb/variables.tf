variable "app_name" {
	type = string
	default = ""
}

variable "vpc_id" {
	type = string
	default = ""
	description = "VPC ID to deploy the resources into. Default region VPC if empty."
}

variable "subnet_ids" {
	type = list(string)
	default = [ ]
	description = "Subnets IDs to deploy the ALB into"
}

variable "subnet_tag_key" {
	type = string
	default = ""
	description = "Tag name of the subnets to filter for"
}

variable "subnet_tag_value" {
	type = string
	default = ""
	description = "Tag value of the subnets to filter for"
}

variable "use_fixed_response" {
	type = bool
	default = true
	description = "Flag for deployment without target group. Returns a fixed response when true. Switch to false when TG is setup"
}

variable "listener_port" {
	type = number
	default = 80
	description = "Port on which the ALB should be listening"
}

variable "target_port" {
	type = number
	default = 80
	description = "Port on which the target (EC2, ECS, IP) should be listening"
}

variable "target_protocol" {
	type = string
	default = "HTTP"
	description = "Protocol which the target (EC2, ECS, IP) handles"
}