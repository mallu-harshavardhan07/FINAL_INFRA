module "backend_alb" {
  source = "terraform-aws-modules/alb/aws"
  internal = true
  version = "9.16.0"
  name = "backend-alb"
  vpc_id =  local.vpc_id
  subnets = local.private_subnet_ids
  create_security_group = false
  security_groups = [local.backend_alb_sg_id]
  tags = {
    Project = "roboshop"
    Env = "Dev"
    Name = "roboshop-dev-backend-alb"
  }

}
resource "aws_alb_listener" "backend_alb" {
  load_balancer_arn = module.backend_alb.arn
  port = "80"
  protocol = "HTTP" 
  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "<h1>Hello, Iam from Backend ALB<h1>"
      status_code = "200"
    }
  }
}
variable "zone_id" {
  default = "Z03390001OMXCO0XSJRXF"
}
variable "zone_name" {
  default = "malluharshavardhanreddy.site"
}
resource "aws_route53_record" "www" {
  zone_id = var.zone_id
  name    = "*.backend-dev.${var.zone_name}"
  type    = "A"

  alias {
    name                   = module.backend_alb.dns_name
    #the below one is zone of alb
    zone_id                = module.backend_alb.zone_id
    evaluate_target_health = true
  }
}