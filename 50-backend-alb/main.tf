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