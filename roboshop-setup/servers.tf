data "aws_ami" "ami" {
  most_recent      = true
  name_regex       = "Centos-8-DevOps-Practice"
  owners           = ["973714476881"]
}

resource "aws_instance" "frontend" {
  ami           = data.aws_ami.ami.image_id
  instance_type = "t3.micro"
  vpc_security_group_ids = ["sg-0ee48eaa134172d7d"]
  tags = {
    Name = "frontend"
  }
}

resource "aws_route53_record" "frontend" {
  zone_id = "Z10218511FGAD8YC6L1HI"
  name    = "frontend-dev.shujadevops.online"
  type    = "A"
  ttl     = 300
  records = [aws_instance.frontend.private_ip]
}