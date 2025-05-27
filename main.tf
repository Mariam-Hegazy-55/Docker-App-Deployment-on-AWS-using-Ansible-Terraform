module "vpc" {
  source   = "./vpc"
  cidr     = var.cidr
  sub-cidr = var.sub-cidr
  sub-az   = var.sub-az

}

module "key" {
  source = "./key"
}


module "ec2" {
  source   = "./ec2"
  ami      = var.ami
  type     = var.instance_type
  sub_id   = module.vpc.sub_id
  key_name = module.key.key_name
  vpc_id   = module.vpc.vpc_id
  key_path = var.key_path
  depends_on = [ module.key ]
}
