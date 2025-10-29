resource "aws_ssm_parameter" "store_frontend_sg_id" {
  name  = "/roboshop/dev/frontend_sg_id"
  type  = "String"
  value = module.frontend.sg_id
}
resource "aws_ssm_parameter" "store_bastion_sg_id" {
  name  = "/roboshop/dev/bastion_sg_id"
  type  = "String"
  value = module.bastion.sg_id
}
resource "aws_ssm_parameter" "store_backend_alb_sg_id" {
  name  = "/roboshop/dev/backend_alb_sg_id"
  type  = "String"
  value = module.backend_alb.sg_id
}
resource "aws_ssm_parameter" "vpn_sg_id" {
  name  = "/roboshop/dev/vpn_sg_id"
  type  = "String"
  value = module.vpn.sg_id
}
resource "aws_ssm_parameter" "mongodb_sg_id" {
  name  = "/roboshop/dev/mongodb_sg_id"
  type  = "String"
  value = module.mongodb.sg_id
}
resource "aws_ssm_parameter" "redis_sg_id" {
  name  = "/roboshop/dev/redis_sg_id"
  type  = "String"
  value = module.redis.sg_id
}

resource "aws_ssm_parameter" "mysql_sg_id" {
  name  = "/roboshop/dev/mysql_sg_id"
  type  = "String"
  value = module.mysql.sg_id
}
resource "aws_ssm_parameter" "rabbitmq_sg_id" {
  name  = "/roboshop/dev/rabbitmq_sg_id"
  type  = "String"
  value = module.rabbitmq.sg_id
}

