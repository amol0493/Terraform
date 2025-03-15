resource "aws_vpc" "main" {
     cidr_block = var.vpc_cidr_value
     enable_dns_support  = true
     enable_dns_hostnames = true
     tags= {
      Name= var.vpc_name_value
}
}

resource "aws_subnet" "public" {
       vpc_id = aws_vpc.main.id
       cidr_block  = var.public_subnet_cidr_value
       availability_zone= var.availability_zone_value

       tags={
         Name= "{var.vpc_name_value}-public-subnet"
}
}

resource "aws_internet_gateway" "gw"{
         vpc_id= aws_vpc.main.id
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}
    
