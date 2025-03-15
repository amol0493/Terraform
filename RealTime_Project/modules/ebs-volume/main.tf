resource "aws_ebs_volume" "volume" {
  availability_zone = "us-east-1a"
  size              = var.volume_size
  type              = var.volume_type

  tags = {
    Name = "my-ebs-volume"
  }
}
