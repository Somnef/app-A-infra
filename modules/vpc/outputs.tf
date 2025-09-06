output "vpc_id" {
	value = aws_vpc.app.id
	description = "ID of the VPC created in the module"
}

output "public_subnet_ids" {
	value = aws_subnet.public_subnets[*].id
	description = "List of IDs of the public subnets of the VPC"
}

output "private_subnet_ids" {
	value = aws_subnet.private_subnets[*].id
	description = "List of IDs of the private subnets of the VPC"
}