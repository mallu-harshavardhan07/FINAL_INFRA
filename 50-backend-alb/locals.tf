locals {
    vpc_id = data.aws_ssm_parameter.get_vpc_id.value
     private_subnet_ids = split ("," , data.aws_ssm_parameter.private_subnet.value)
     backend_alb_sg_id = data.aws_ssm_parameter.store_backend_alb_sg_id.value
}