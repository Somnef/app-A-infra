resource "aws_security_group" "alb_sg" {
	name = var.app_name == "" ? "alb-sg" : "${var.app_name}-alb-sg"
	description = "Allow inbound HTTP and HTTPS traffic and all outbound traffic"
	vpc_id = var.vpc_id == "" ? data.aws_vpc.default_vpc.id : var.vpc_id
}

resource "aws_security_group_rule" "allow_inbound_http" {
	security_group_id = aws_security_group.alb_sg.id

	type = "ingress"
	from_port = 80
	to_port = 80
	protocol = "tcp"
	cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "allow_inbound_https" {
	security_group_id = aws_security_group.alb_sg.id

	type = "ingress"
	from_port = 443
	to_port = 443
	protocol = "tcp"
	cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "allow_outbound_all" {
	security_group_id = aws_security_group.alb_sg.id

	type = "egress"
	from_port = 0
	to_port = 0
	protocol = "-1"
	cidr_blocks = ["0.0.0.0/0"]
}
