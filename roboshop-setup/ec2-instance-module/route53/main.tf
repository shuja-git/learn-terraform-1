resource "aws_route53_record" "record" {
  zone_id = "Z10218511FGAD8YC6L1HI"
  name    = "${var.component}-dev.shujadevops.online"
  type    = "A"
  ttl     = 300
  records = [aws_instance.instance.private_ip]
}



