terraform {
  backend "s3" {
    bucket = "devopsb71-bucket"
    key    = "remote-s3/terraform.tfstate"
    region = "us-east-1"
  }
}
data "aws_ami" "ami" {
  most_recent      = true
  name_regex       = "Centos-8-DevOps-Practice"
  owners           = ["973714476881"]
}

resource "aws_instance" "instance" {
  ami           = data.aws_ami.ami.image_id
  instance_type = "t3.micro"
  vpc_security_group_ids = ["sg-0ee48eaa134172d7d"]
  tags = {
    Name = "frontend"
  }
}
