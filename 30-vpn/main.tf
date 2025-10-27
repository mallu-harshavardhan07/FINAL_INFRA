resource "aws_key_pair" "openvpn" {
  key_name   = "openvpn"
  public_key = file("C:\\daws\\linkedin\\openvpn.pub") # for mac use /
}

resource "aws_instance" "vpn" {
  ami           = local.ami_id
  instance_type = "t3.micro"
  vpc_security_group_ids = [local.vpn_sg_id]
  subnet_id = local.public_subnet_id
  #key_name = "daws-84s" # make sure this key exist in AWS
  key_name = aws_key_pair.openvpn.key_name
  user_data = file("openvpn.sh")

  tags =  {
        Name = "roboshop-dev-vpn"
    }
  
}
 
# resource "aws_route53_record" "vpn" {
#   zone_id = var.zone_id
#   name    = "vpn-${var.environment}.${var.zone_name}"
#   type    = "A"
#   ttl     = 1
#   records = [aws_instance.vpn.public_ip]
#   allow_overwrite = true
# }