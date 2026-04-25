output "output_vpc_id" {
  description = "vpc id inrusion vpc"
  value = aws_vpc.intrusion_layer.id
}

output "output_private_subnet_1" {
  value = aws_subnet.private_subnet_01.id
}

output "output_private_subnet_2" {
  value = aws_subnet.private_subnet_02.id
}

output "output_public_subnet" {
  value = aws_subnet.public_subnet_01.id
}