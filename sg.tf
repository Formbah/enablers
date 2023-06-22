module "security-group" {
  source = "terraform-aws-modules/security-group/aws"
  version = "5.1.0"

  name        = "${local.prefix}-sg"
  description = "Security group for VPC with ssh rules"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks      = ["0.0.0.0/0"]
  ingress_rules            = ["ssh-tcp"]
  egress_rules             = ["all-all"]

  
    tags = merge(
        {Name= "{local.prefix}-sg"},local.common_tags

    )    
    depends_on = [module.vpc]
}