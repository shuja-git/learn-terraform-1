resource "aws_spot_instance_request" "node" {
  ami           = "ami-0a962a9c6222cf89e"
  instance_type = "t3.small"
  vpc_security_group_ids = ["sg-0ee48eaa134172d7d"]
  wait_for_fulfillment = true
  tags = {
    Name = "test-server"
  }
}
resource "aws_ec2_tag" "node_tag" {
  resource_id = aws_spot_instance_request.node.spot_instance_id
  key         = var.monitor
  value       = var.monitor ? "yes" : "no"
}
###### the above one i did not get, try later
