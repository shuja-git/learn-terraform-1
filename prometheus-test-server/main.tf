resource "aws_spot_instance_request" "node1" {
  ami           = "ami-0a962a9c6222cf89e"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-0ee48eaa134172d7d"]
  wait_for_fulfillment = true
  tags = {
    Name = "prometheus-test-server"
  }
}
resource "aws_ec2_tag" "example" {
  resource_id = aws_spot_instance_request.node1.spot_instance_id
  key         = "Name"
  value       = "prometheus-test-server"
}

resource "aws_spot_instance_request" "node2" {
  ami           = "ami-0a962a9c6222cf89e"
  instance_type = "t2.micro"
  wait_for_fulfillment = true
  vpc_security_group_ids = ["sg-0ee48eaa134172d7d"]
  tags = {
    Name = "prometheus-test-node"
  }
}
resource "aws_ec2_tag" "example" {
  resource_id = aws_spot_instance_request.node2.spot_instance_id
  key         = "Name"
  value       = "prometheus-test-node"
}
