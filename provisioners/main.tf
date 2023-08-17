resource "aws_instance" "instance" {
  ami = "ami-03265a0778a880afb"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-0ee48eaa134172d7d"]
  tags = {
    Name = "demo"
  }

  provisioner "remote-exec" {

    connection {
      host     = self.public_ip
      user     = "root"
      password = "DevOps321"
    }
    inline = [
    "echo Hello"
]

  }
}
