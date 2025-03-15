variable "instance_type_value"{
       type= string
       default= "t2.micro"
}
variable "ami_value" {
       type= string
 
}
variable "subnet_id_value"{
     description= "This is subnet"
     type       = string

}

variable "instance_name_value"{
   description= "This is a ec2 instance value"
   type = string
   default= "My-Ec2-instance"
}
