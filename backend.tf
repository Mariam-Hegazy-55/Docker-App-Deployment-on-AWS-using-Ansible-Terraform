terraform {
  backend "s3" {
    bucket = "mariam-backend"
    key    = "ansible-terraform/terraform.tfstate"
    region = "eu-west-2"

  }
}
