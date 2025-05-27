# Create the main VPC
resource "aws_vpc" "project_vpc" {
    cidr_block           = var.cidr                      
    enable_dns_support   = true                          
    enable_dns_hostnames = true                          
tags = {
      name = "project VPC"
      Name = "project VPC"
    }
}

# Create the public subnet
resource "aws_subnet" "public-subnet" {
  vpc_id = aws_vpc.project_vpc.id
  cidr_block = var.sub-cidr
  availability_zone = var.sub-az
  tags = {
    name="public subnet"
    Name="public subnet"
  }
}


#Create internet gateway (IGW)
resource "aws_internet_gateway" "Project-IGW" {
  vpc_id = aws_vpc.project_vpc.id
  tags = {
    name = "Project IGW"
    Name = "Project IGW"
  }
}

#create the route table
resource "aws_route_table" "Project-RT" {
  vpc_id = aws_vpc.project_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.Project-IGW.id
  }
  tags = {
    name= " Project-RT"
    Name = " Project-RT"
  }
}

# Asssociate the public subnet with the public subnet with the route table 
resource "aws_route_table_association" "name" {
  subnet_id = aws_subnet.public-subnet.id
  route_table_id = aws_route_table.Project-RT.id
}

