resource "aws_key_pair" "key"{
      key_name= "id_ed25519"
      public_key = file(pathexpand("~/.ssh/id_ed25519.pub"))
}

resource "aws_default_vpc" "default_vpc" {

}

resource "aws_security_group" "allow_ssh"{
       name= "allow ssh"
       description= "Allow ssh inbound traffic"


 vpc_id = aws_default_vpc.default_vpc.id

ingress {
   description= "TLC from vpc"
   from_port= 22
   to_port= 22
   protocol= "TCP"
   cidr_blocks= ["0.0.0.0/0"]

}
    tags= {
      Name= "allow_ssh"
}
}


resource "aws_instance" "my_instance"{
        ami= var.ami_id
        instance_type= "t2.micro"
        key_name= aws_key_pair.key.key_name
        security_groups= [aws_security_group.allow_ssh.name]
       tags={
         Name= "my-ec2"
}
}
output "arn" {
  value = aws_instance.my_instance.arn
}
output "public_ip"{
        value= aws_instance.my_instance.public_ip
}
