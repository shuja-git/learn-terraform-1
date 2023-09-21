resource "aws_spot_instance_request" "node1" {
  ami           = "ami-0a962a9c6222cf89e"
  instance_type = "t2.micro"
  wait_for_fulfillment = true
  tags = {
    Name = "prometheus-test-server"
  }
}
resource "aws_spot_instance_request" "node2" {
  ami           = "ami-0a962a9c6222cf89e"
  instance_type = "t2.micro"
  wait_for_fulfillment = true
  tags = {
    Name = "prometheus-test-node"
  }
}

