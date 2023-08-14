variable "ec2" {

    default = {

         catalogue = {
         ec2-output = "172.31.87.23"
}
  user = {
  ec2-output = "172.31.85.241"
}
}
}

output "test"{
    value = var.ec2
}
