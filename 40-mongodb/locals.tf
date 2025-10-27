locals {
  database_subnet_id = split ("," , data.aws_ssm_parameter.database_subnet.value)[0]
}