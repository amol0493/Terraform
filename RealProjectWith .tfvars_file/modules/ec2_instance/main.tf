provider "aws" {
      region= "us-east-1"
}

variable "ami"{
  description= "this is ami id"
}
variable "instance_name"{
       description ="value"

}
variable "instance_type" {
      description= "this is instance type"
}

variable "subnet_id" {
     description= "This is a subnet id"
}

resource "aws_instance" "example"{
      ami= var.ami
      instance_type= var.instance_type
      subnet_id= var.subnet_id
      tags= {
       Name= var.instance_name
}
}
