variable "availability_zone" {
  type = string
}

variable "volume_size" {
  type    = number
  default = 10
}

variable "volume_type" {
  type    = string
  default = "gp2"
}

variable "volume_name" {
  type    = string
  default = "my-ebs-volume"
}
