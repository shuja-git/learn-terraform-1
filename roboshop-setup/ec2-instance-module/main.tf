module "ec2" {
  for_each = var.instances
  source = "./ec2"
  instance_type = each.value["type"]
  component = each.value["name"]

}

module "sg" {
  source = "./sg"
}
output "print_sg-id" {
  value = module.sg.sg_id
}