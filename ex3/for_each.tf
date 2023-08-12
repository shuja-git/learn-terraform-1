resource "null_resource" "nothing" {
  for_each = var.d1
  name = each.value["name"]
  type = each.value["type"]
}
variable "d1" {
  default = {
    catalogue = {
        name = "catalogue"
        type = "t2.micro"
    },
    user = {
        name = "user"
        type = "t3.micro"
    }
  }
}
