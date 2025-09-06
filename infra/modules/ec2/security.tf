resource "aws_security_group" "instance_sg" {
	name = "instance-sg"
	vpc_id = var.vpc_id

	ingress {
		from_port = 80
		to_port = 80
		protocol = "tcp"
		security_groups = compact(concat([var.alb_sg_id], var.use_bastion ? [aws_security_group.bastion_sg[0].id] : []))
		# cidr_blocks = ["0.0.0.0/0"]
	}

	# DELETE AFTER
	ingress {
		from_port = 22
		to_port = 22
		protocol = "tcp"
		security_groups = compact((var.use_bastion ? [aws_security_group.bastion_sg[0].id] : []))
		# cidr_blocks = ["0.0.0.0/0"]
	}


	egress {
		from_port = 0
		to_port = 0
		protocol = "-1"
		cidr_blocks = ["0.0.0.0/0"]
	}
}

resource "aws_security_group" "bastion_sg" {
	count = var.use_bastion ? 1 : 0

	name   = "bastion-sg"
	vpc_id = var.vpc_id

	ingress {
		from_port   = 22
		to_port     = 22
		protocol    = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}

	egress {
		from_port   = 0
		to_port     = 0
		protocol    = "-1"
		cidr_blocks = ["0.0.0.0/0"]
	}
}

resource "aws_key_pair" "bastion_key" {
	count = var.use_bastion ? 1 : 0
	
	key_name   = "bastion-key"
	public_key = file("${path.module}/keys/id_rsa.pub")
}