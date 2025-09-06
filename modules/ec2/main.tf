resource "aws_instance" "instances" {
	key_name = var.use_bastion ? aws_key_pair.bastion_key[0].key_name : null

	count = var.instance_count

	ami = "ami-0991dba6cc8be757d"
	instance_type = "t2.micro"

	vpc_security_group_ids = [aws_security_group.instance_sg.id]

	subnet_id = element(var.private_subnet_ids, count.index)

	user_data = <<EOF
#!/bin/bash
until curl -s --head http://www.google.com > /dev/null; do
    echo "Waiting for internet..."
    sleep 5
done
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd
echo "<h1>Hello World from $(hostname -f)</h1>" > /var/www/html/index.html
EOF
	
	tags = {
		Name = "instance-${count.index}"
	}
}

resource "aws_instance" "bastion" {
	count = var.use_bastion ? 1 : 0

	ami                         = "ami-0991dba6cc8be757d"
	instance_type               = "t2.micro"
	subnet_id                   = var.public_subnet_ids[0]
	vpc_security_group_ids      = [aws_security_group.bastion_sg[0].id]
	associate_public_ip_address = true

	key_name = aws_key_pair.bastion_key[0].key_name

	tags = {
		Name = "bastion"
	}
}