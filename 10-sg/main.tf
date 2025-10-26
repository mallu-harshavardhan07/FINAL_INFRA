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
resource "aws_security_group_rule" "bastion_laptop" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = module.bastion.sg_id
}