data "aws_ami" "ami" {
  most_recent      = true
  name_regex       = "Centos-8-DevOps-Practice"
  owners           = ["973714476881"]
}

resource "aws_instance" "frontend" {
  count =   length(var.instances)  
  ami           = data.aws_ami.ami.image_id
  instance_type = "t3.micro"
  vpc_security_group_ids = ["sg-0ee48eaa134172d7d"]
  tags = {
    Name = var.instances[count.index]
  }
 }
 variable "instances" {
   default = [ "cart", "catalogue", "shipping", "payment", "user"]
 }


