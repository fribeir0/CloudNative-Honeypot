resource "aws_subnet" "private_subnet_01"{
    vpc_id = aws_vpc.intrusion_layer.id
    cidr_block = "172.16.12.0/24"

    tags = {
      Name = "subnet private 01"
    }
}

resource "aws_subnet" "private_subnet_02"{
    vpc_id = aws_vpc.intrusion_layer.id
    cidr_block = "172.16.13.0/24"

    tags = {
      Name = "subnet private 02"
    }
}

resource "aws_subnet" "public_subnet_01" {
    vpc_id = aws_vpc.intrusion_layer.id
    cidr_block = "172.16.24.0/24"
    tags = {
      Name = "subnet_public"
    }

}
