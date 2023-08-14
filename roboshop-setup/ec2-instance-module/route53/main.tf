#resource "aws_route53_record" "record" {
#  zone_id = "Z10218511FGAD8YC6L1HI"
#  name    = "www.example.com"
#  type    = "A"
#  ttl     = 300
#  records = [aws_eip.lb.public_ip]
#}