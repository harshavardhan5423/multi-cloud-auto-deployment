resource "aws_security_group" "web" {

dynamic "ingress" {
for_each = var.ssh_key_name == "" ? [] : [1]
content {
description = "SSH"
from_port = 22
to_port = 22
protocol = "tcp"
cidr_blocks = [var.allow_ssh_cidr]
}
}

egress {
from_port = 0
to_port = 0
protocol = "-1"
cidr_blocks = ["0.0.0.0/0"]
}
}

data "aws_vpc" "default" {
default = true
}

data "aws_subnets" "default" {
filter {
name = "vpc-id"
values = [data.aws_vpc.default.id]
}
}

resource "aws_instance" "web" {
ami = "ami-0c4fc5dcabc9df21d"
instance_type = "t3.micro"
subnet_id = data.aws_subnets.default.ids[0]
vpc_security_group_ids = [aws_security_group.web.id]
key_name = var.ssh_key_name == "" ? null : var.ssh_key_name
user_data = <<-EOF
#!/bin/bash
yum update -y
amazon-linux-extras install nginx1 -y || yum install -y nginx
echo "<h1>AWS NGINX — $(hostname)</h1>" > /usr/share/nginx/html/index.html
systemctl enable nginx
systemctl start nginx
EOF
tags = {
Name = "${var.instance_name_prefix}-aws"
}
}

# Latest Amazon Linux 2 AMI

data "aws_ami" "amazon_linux2" {
owners = ["amazon"]
most_recent = true
filter {
name = "name"
values = ["amzn2-ami-hvm-*-x86_64-gp2"]
}
}

resource "aws_eip" "web" {
instance = aws_instance.web.id
domain = "vpc"
}