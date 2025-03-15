variable "vpc_cidr_value" {
    description= "This is a vpc cidr"
    type       = string
    default      = "10.0.0.0/16"
}

variable "public_subnet_cidr_value" {
      description= "This is public cidr"
      type       = string 
      default      = "10.0.0.0/24"
}

variable "availability_zone_value" {
          description= "This is az"
          default    = "us-east-1a"
         
}

variable "vpc_name_value"{
       description= "This is a vpc name"
       default    = "my-vpc"
}
