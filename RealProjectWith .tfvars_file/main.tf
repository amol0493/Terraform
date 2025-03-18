provider "aws" {
   region= "us-east-1"
}

variable "ami" {
   description= "value"
}

variable "instance_type"{
   description= "value"
   type= map(string)

  default= {
     "dev"   = "t2.micro"
     "prod"  = "t2.xlarge"
     "stage" = "t3.medium"

}

}
variable "subnet_id" {
    description= "value"
}

variable "instance_name" {
        description= "value"
}
 
module "ec2_instance"{
      source= "./modules/ec2_instance"
      ami= var.ami
      instance_type= lookup(var.instance_type, terraform.workspace, "t2.micro")
      subnet_id = var.subnet_id
      instance_name= var.instance_name
}
module "vpc" {
  source                      = "./modules/vpc"
  vpc_name_value              = var.vpc_name_value
  vpc_cidr_value              = var.vpc_cidr_value
  public_subnet_cidr_value    = var.public_subnet_cidr_value
  availability_zone_value     = var.availability_zone_value
}

variable "vpc_name_value" {
  type = string
}

variable "vpc_cidr_value" {
  type = string
}

variable "public_subnet_cidr_value" {
  type = string
}

variable "availability_zone_value" {
  type = string
}
