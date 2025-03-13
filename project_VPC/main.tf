resource "aws_vpc" "myvpc" {
      cidr_block= var.cidr
}

resource "aws_subnet" "sub1"{
     vpc_id                 = aws_vpc.myvpc.id
     cidr_block             = "10.0.0.0/24"
     availability_zone      = "us-east-1a"
     depends_on             = [aws_vpc.myvpc]   
}

resource "aws_internet_gateway" "igw" {
       vpc_id= aws_vpc.myvpc.id
}

resource "aws_route_table" "RT"{
    vpc_id= aws_vpc.myvpc.id
   
   route {
     cidr_block = "0.0.0.0/0"
     gateway_id= aws_internet_gateway.igw.id
}
}

resource "aws_route_table_association" "rta" {
          subnet_id= aws_subnet.sub1.id
          route_table_id= aws_route_table.RT.id
}
resource "aws_security_group" "websg"{
    name= "web"
    vpc_id= aws_vpc.myvpc.id
  
   ingress{
     from_port= 80
     to_port= 80
     protocol= "tcp"
      cidr_blocks= ["0.0.0.0/0"]
}   
   ingress {
     from_port= 22
     to_port= 22
     protocol= "tcp"
     cidr_blocks= ["0.0.0.0/0"]
}    
      tags = {
    Name = "Web-sg"
  }
}

resource "aws_s3_bucket" "example" {
  bucket = "amol2025roject"
}

resource "aws_instance" "webserver1" {
  ami                    = "ami-04b4f1a9cf54c11d0"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.websg.id]
  subnet_id              = aws_subnet.sub1.id
  user_data              = base64encode(file("userdata.sh"))
      
     tags={
       Name="vpc-instance"
}
}

