locals {

  prefix = var.vpc_name

  common_tags = {
    Env = "Production"
    Team = "Enablers"
  }
 
}