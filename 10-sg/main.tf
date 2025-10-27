module "frontend" {
  source =  "git::https://github.com/mallu-harshavardhan07/Terraform_Modules.git//sg-module?ref=main"
  project = "Roboshop"
  env = "Dev"
  sg_name = "first_sg"
  sg_description = "prepaing for frontend"
  vpc_id = data.aws_ssm_parameter.get_vpc_id.value 
}
module "bastion" {
    source = "git::https://github.com/mallu-harshavardhan07/Terraform_Modules.git//sg-module?ref=main"
    project = "Roboshop"
    env = "Dev"
    sg_name = "Bastion-sg"
    sg_description = "This is bastion sg"
    vpc_id = data.aws_ssm_parameter.get_vpc_id.value
}
module "backend_alb" {
    source = "git::https://github.com/mallu-harshavardhan07/Terraform_Modules.git//sg-module?ref=main"
    project = "Roboshop"
    env = "Dev"
    sg_name = "backend-alb"
    sg_description = "This is for backend alb"
    vpc_id = data.aws_ssm_parameter.get_vpc_id.value
}
module "vpn" {
    source = "git::https://github.com/mallu-harshavardhan07/Terraform_Modules.git//sg-module?ref=main"
    project = "Roboshop"
    env = "Dev"
    sg_name = "vpn"
    sg_description = "For vpn"
    vpc_id = data.aws_ssm_parameter.get_vpc_id.value
}
# bastion accepting connections from my laptop
resource "aws_security_group_rule" "bastion_laptop" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = module.bastion.sg_id
}
#backend alb accepting connection from my bastion host on port no 80
resource "aws_security_group_rule" "backend_alb_bastion" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  source_security_group_id = module.bastion.sg_id
  security_group_id = module.backend_alb.sg_id
}
#VPN ports 22, 443, 1194, 943 -->vpn ports
resource "aws_security_group_rule" "vpn_ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = module.vpn.sg_id
}
resource "aws_security_group_rule" "vpn_https" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = module.vpn.sg_id
}
resource "aws_security_group_rule" "vpn_1194" {
  type              = "ingress"
  from_port         = 1194
  to_port           = 1194
  protocol          = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = module.vpn.sg_id
}
resource "aws_security_group_rule" "vpn_943" {
  type              = "ingress"
  from_port         = 943
  to_port           = 943
  protocol          = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = module.vpn.sg_id
}