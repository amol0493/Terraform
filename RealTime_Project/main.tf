provider "aws" {
    region= "us-east-1"
}

module  "ec2_instace" {
       source             = "./modules/ec2_instance"
       instance_name_value  = "MyModule_ec2"
       ami_value            = "ami-04b4f1a9cf54c11d0"
       instance_type_value= "t2.micro"
       subnet_id_value    = "subnet-0f686a1af71e1aacc" 
      
      
}
module "vpc" {
  source              = "./modules/vpc"
  vpc_name_value            = "my-project-vpc"
  vpc_cidr_value            = "10.0.0.0/16"
  public_subnet_cidr_value  = "10.0.1.0/24"
  availability_zone_value = "us-east-1a"
}

module "s3_bucket" {
  source      = "./modules/s3_bucket"
  bucket_name = "amol-bucket-name" # Must be globally unique
}

module "ebs_volume" {
  source              = "./modules/ebs_volume"
  availability_zone =  "us-east-1a"
}
