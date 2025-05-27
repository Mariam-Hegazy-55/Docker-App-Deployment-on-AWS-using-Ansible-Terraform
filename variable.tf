variable "region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "eu-west-2"
}

# VPC CIDR block 
variable "cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "20.0.0.0/16"
}

variable "sub-cidr" {
  description = "CIDR block of public subnet"
  type        = string
  default     = "20.0.0.0/24"
}

variable "sub-az" {
  description = "availability zone to create subnets in"
  type        = string
  default     = "eu-west-2a"
}

variable "ami" {
  type        = string
  description = "EC2 ami"
}

variable "instance_type" {

}
variable "key_path" {

}