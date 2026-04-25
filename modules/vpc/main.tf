resource "aws_vpc" "intrusion_layer" {
    cidr_block = "172.16.0.0/16"
    tags = {
      Name = "var.vpc_name"
    }
}


