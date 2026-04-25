resource "aws_eip" "nat" {
  domain = "vpc"
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.intrusion_layer.id
}

resource "aws_nat_gateway" "nat" {
    allocation_id = aws_eip.nat.id
    subnet_id = aws_subnet.public_subnet_01.id
}

resource "aws_route_table" "private-rt" {
    vpc_id = aws_vpc.intrusion_layer.id
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.nat.id
    }
}


resource "aws_route_table" "public-rt" {
    vpc_id = aws_vpc.intrusion_layer.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }
}

resource "aws_route_table_association" "ass-private_01" {
    subnet_id = aws_subnet.private_subnet_01.id
    route_table_id = aws_route_table.private-rt.id

}

resource "aws_route_table_association" "ass-private_02" {
    subnet_id = aws_subnet.private_subnet_02.id
    route_table_id = aws_route_table.private-rt.id

}

resource "aws_route_table_association" "ass-public-01" {
    subnet_id = aws_subnet.public_subnet_01.id
    route_table_id = aws_route_table.public-rt.id
}