data "aws_vpc" "default_vpc" {
	default = true
}

data "aws_subnets" "subnets" {
	filter {
		name = "vpc-id"
		values = [var.vpc_id == "" ? data.aws_vpc.default_vpc.id : var.vpc_id]
	}

	# get subnets with specified tag if any is given, ignore otherwise
	dynamic "filter" {
		for_each = var.subnet_tag_key != "" && var.subnet_tag_value != "" ? [1] : []

		content {
			name = "tag:${var.subnet_tag_key}"
			values = [var.subnet_tag_value]
		}
	}
}