resource "aws_instance" "App" {
  ami = var.ami
  instance_type = var.type
  subnet_id = var.sub_id
  vpc_security_group_ids = [aws_security_group.project_SG.id]
  key_name = var.key_name
  associate_public_ip_address = true 
  

}


resource "aws_security_group" "project_SG" {
  name        = "Web_SG"
  description = "enable http/https access on port 80 for alb sg"
  vpc_id      = var.vpc_id

  # Inbound rule: Allow HTTP (port 80) access from ALB
  ingress {
    description     = "http access"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    cidr_blocks = ["0.0.0.0/0"]    
  }

  # Inbound rule: Allow SSH (port 22) access from ALB
  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port       = 4000
    to_port         = 4000
    protocol        = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound rule: Allow all traffic (required for internet access and updates)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    name="ec2-sg"
    Name="EC2-SG"
  }
}