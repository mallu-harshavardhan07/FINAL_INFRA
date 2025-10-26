data "aws_ssm_parameter" "get_vpc_id" {
  name = "/roboshop/env/vpc_id"
}
data "aws_ssm_parameter" "private_subnet" {
  name = "/roboshop/dev/private_subnet_ids"
}
data "aws_ssm_parameter" "store_backend_alb_sg_id" {
  name = "/roboshop/dev/backend_alb_sg_id"
 }