provider "aws" {
        region = var.region
}

resource "aws_instance" "web-instance" {
        ami = var.aws_ami
        instance_type = "t2.micro"
        key_name = var.key_name
        vpc_security_group_ids = ["${aws_security_group.webSG.id}"]
  tags = {
    Name = "web-instance"
  }


provisioner "local-exec" {
    command = <<EOD
cat <<EOF > aws_hosts
[dev]
${aws_instance.web-instance.private_ip}
EOF
EOD
}

  provisioner "local-exec" {
command = "sleep 120; ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u ec2-user --private-key ./thought.pem -i 'aws_hosts' play_without_roles.yml"  
}
}

#Creating the Security Group  
resource "aws_security_group" "webSG" {
  name        = "webSG"
  description = "Allow ssh  inbound traffic"
  vpc_id      = "vpc-ffbef285"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
    
  }
}
