data "aws_ami" "ami" {
  most_recent      = true
  name_regex       = "Centos-8-DevOps-Practice"
  owners           = ["973714476881"]
}

resource "aws_instance" "instance" {
  for_each = var.instances
  ami           = data.aws_ami.ami.image_id
  instance_type = each.value["type"]
  vpc_security_group_ids = ["sg-0ee48eaa134172d7d"]
  tags = {
    Name = each.value["name"]
  }
}

variable "instances" {
  default = {
    catalogue = {
        name = "catalogue"
        type = "t2.micro"
    },
    user = {
        name = "user"
        type = "t2.micro"
    }
  }
}
output "ip" {
    value = aws_instance.instance
}
