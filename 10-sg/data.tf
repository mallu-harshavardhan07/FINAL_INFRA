data "aws_ssm_parameter" "get_vpc_id" {
  name = "/roboshop/env/vpc_id"
}