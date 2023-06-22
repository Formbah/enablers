data "aws_ssm_parameter" "amazon_linux" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}



resource "aws_instance" "enablers_server" {
    ami           = nonsensitive(data.aws_ssm_parameter.amazon_linux.value)
    instance_type = var.instance_type["small"]
    vpc_security_group_ids = [module.security-group.security_group_id]
    subnet_id = module.vpc.public_subnets[0]
    key_name = "gio-key-pair"
    
    iam_instance_profile = aws_iam_instance_profile.s3_access_profile.name

    tags = merge({Name = "${local.prefix}-server"}, local.common_tags)

    depends_on = [ module.vpc, module.security-group ]

}