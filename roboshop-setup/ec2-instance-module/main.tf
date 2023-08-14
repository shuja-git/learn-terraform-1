module "ec2" {
  for_each = var.instances
  source = "./ec2"
  instance_type = each.value["type"]
  component = each.value["name"]
  sg_id = module.sg.sg_id


}

module "sg" {
  source = "./sg"
  }

output "ec2-out" {
  value = module.ec2.ec2-output
}