resource "aws_vpc" "app" {
	cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "public_subnets" {
	count = length(var.public_subnet_cidrs)
	vpc_id = aws_vpc.app.id
	cidr_block = element(var.public_subnet_cidrs, count.index)
	availability_zone = element(var.azs, count.index)

	map_public_ip_on_launch = true

	tags = {
		"Name": "App Public Subnet ${count.index}"
		"Privacy": "Public"
	}
}

resource "aws_subnet" "private_subnets" {
	count = length(var.public_subnet_cidrs)
	vpc_id = aws_vpc.app.id
	cidr_block = element(var.private_subnet_cidrs, count.index)
	availability_zone = element(var.azs, count.index)

	tags = {
		"Name": "App Private Subnet ${count.index}"
		"Privacy": "Private"
	}
}

resource "aws_internet_gateway" "app" {
	vpc_id = aws_vpc.app.id
}

resource "aws_route_table" "second_rt" {
	vpc_id = aws_vpc.app.id

	route {
		cidr_block = "0.0.0.0/0"
		gateway_id = aws_internet_gateway.app.id
	}
}

resource "aws_route_table_association" "public_subnet_asso" {
	count = length(aws_subnet.public_subnets)
	subnet_id = element(aws_subnet.public_subnets[*].id, count.index)
	route_table_id = aws_route_table.second_rt.id
}

resource "aws_eip" "nat" {
	domain = "vpc"
}

resource "aws_nat_gateway" "app" {
	allocation_id = aws_eip.nat.id
	subnet_id = aws_subnet.public_subnets[0].id
}

resource "aws_route_table" "private_rt" {
	vpc_id = aws_vpc.app.id

	route {
		cidr_block = "0.0.0.0/0"
		gateway_id = aws_nat_gateway.app.id
	}
}

resource "aws_route_table_association" "private_subnet_asso" {
	count = length(aws_subnet.private_subnets)
	subnet_id = element(aws_subnet.private_subnets[*].id, count.index)
	route_table_id = aws_route_table.private_rt.id
}