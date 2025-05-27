output "vpc_id" {
  description = "The VPC ID"
  value = aws_vpc.project_vpc.id
}

output "sub_id" {
  description = "The Public Subnet ID"
  value = aws_subnet.public-subnet.id
}