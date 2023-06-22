module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.0.0"
  name = var.vpc_name
  cidr = var.vpc_cidr

  azs             = var.azs
  public_subnets  = var.public_subnets

    map_public_ip_on_launch = true
    enable_vpn_gateway = true
    enable_nat_gateway = false
    enable_dns_hostnames = true
  
  tags = local.common_tags
}