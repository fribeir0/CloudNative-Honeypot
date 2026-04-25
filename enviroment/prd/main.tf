provider "aws" {
  region = var.region
  profile = var.profile
}

module "vpc" {
  source = "../../modules/vpc"
}

module "proxy" {
  source = "../../modules/ec2/proxy"
  vpc_id = module.vpc.output_vpc_id
  subnet_public_id = module.vpc.output_public_subnet
}

module "rdp-private" {
  source = "../../modules/ec2/winserver"
  vpc_id = module.vpc.output_vpc_id
  subnet_private_id = module.vpc.output_private_subnet_1
}