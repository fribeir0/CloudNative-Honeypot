resource "aws_instance" "ec2-proxy" {
    ami = "ami-0d99de470a2818d2b"
    instance_type = "t2.micro"
    subnet_id = var.subnet_private_id
    associate_public_ip_address = "true"
    vpc_security_group_ids = [aws_security_group.ec2-rdp-sg.id]
        
}

resource "aws_security_group" "ec2-rdp-sg" {
  name   = "ec2-rdp-sg"
  vpc_id = var.vpc_id

  ingress {
    description = "RDP access"
    from_port   = 3389
    to_port     = 3389
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