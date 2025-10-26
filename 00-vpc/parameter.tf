resource "aws_ssm_parameter" "vpc_id" {
  name  = "/roboshop/env/vpc_id"
  type  = "String"
  value = module.vpc.vpc_id
}

resource "aws_ssm_parameter" "public_subnet" {
  name  = "/roboshop/dev/public_subnet_ids"
  type  = "StringList"
  value = join(",", module.vpc.public_subnet)
}

resource "aws_ssm_parameter" "private_subnet" {
  name  = "/roboshop/dev/private_subnet_ids"
  type  = "StringList"
  value = join(",", module.vpc.private_subnet)
}

resource "aws_ssm_parameter" "database_subnet" {
  name  = "/roboshop/dev/database_subnet_ids"
  type  = "StringList"
  value = join(",", module.vpc.database_subnet)
}