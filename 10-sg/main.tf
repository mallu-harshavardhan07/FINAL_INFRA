module "create_Sg" {
  source =  "git::https://github.com/mallu-harshavardhan07/Terraform_Modules.git//sg-module?ref=main"
  project = "Roboshop"
  env = "Dev"
  sg_name = "first_sg"
  sg_description = "prepaing for frontend"
  vpc_id = data.aws_ssm_parameter.get_vpc_id.value
  
}