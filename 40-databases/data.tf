data "aws_ami" "joindevops" {
  owners           = ["973714476881"]
  most_recent      = true

  filter {
    name   = "name"
    values = ["RHEL-9-DevOps-Practice"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
data "aws_ssm_parameter" "database_subnet" {
  name = "/roboshop/dev/database_subnet_ids"
}
data "aws_ssm_parameter" "mongodb_sg_id" {
  name = "/roboshop/dev/mongodb_sg_id"
}
data "aws_ssm_parameter" "redis_sg_id" {
  name = "/roboshop/dev/redis_sg_id"
}
data "aws_ssm_parameter" "mysql_sg_id" {
  name = "/roboshop/dev/mysql_sg_id"
}
data "aws_ssm_parameter" "rabbitmq_sg_id" {
  name = "/roboshop/dev/rabbitmq_sg_id"
}