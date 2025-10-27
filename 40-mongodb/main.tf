resource "aws_instance" "mongodb" {
  ami           = data.aws_ami.joindevops.id
  instance_type = "t3.micro"
  vpc_security_group_ids = ["${data.aws_ssm_parameter.mongodb_sg_id.value}"]
  subnet_id = local.database_subnet_id
  tags = {
    Name = "roboshop-dev-monogdb"
  }
}
