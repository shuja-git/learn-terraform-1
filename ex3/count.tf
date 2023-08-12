variable "d1" {
    default = [
        {
            course_name = "aws"
            trainer = "shuja"
        },
        {
            course_name = "devops"
            trainer = "Mohd"
        }
    ]
   }
 output "d1" {
    value = var.d1.*.course_name
 }  