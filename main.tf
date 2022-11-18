# write a script to launch resources on the cloud

# create ec2 instance on AWS

# download dependencies from AWS

provider "aws" {

  # which part of AWS we would like to launch resouces in
  region = "eu-west-1"
}
# create a vpc
resource "aws_vpc" "main-vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = "eng130_osman_vpc"
  }
}
# create internet gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main-vpc.id

  tags = {
    "Name" = "eng130-osman-terraform-ig"
  }
}

# create route table
resource "aws_route_table" "main-route-table" {
  vpc_id = aws_vpc.main-vpc.id
  route {
    cidr_block = var.route-table
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "eng130-osman-terraform-rt"
  }
}

# create subnet
resource "aws_subnet" "subnet-1" {
  vpc_id     = aws_vpc.main-vpc.id
  cidr_block = var.subnet_cidr
  availability_zone = "eu-west-1a"

  tags = {
    Name = "eng130_osman_subnet"
  }
}
# attach route table to subnet
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.subnet-1.id
  route_table_id = aws_route_table.main-route-table.id

}

# create security groups
resource "aws_security_group" "eng130-osman-terraform-sg" {
  name        = "osman-terraform-sg"
  description = "osman-terraform-sg"
  vpc_id      = aws_vpc.main-vpc.id

# inbound rules
  ingress {
    description      = "HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
   
  }

ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
   
  }

# outbound rules
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "eng130-osman-terraform-sg"
  }
}

resource "aws_instance" "app_instance" {
  ami                         = var.ami_id
  key_name 					  = "eng130-new"
  instance_type               = var.instance_type
  associate_public_ip_address = true
  subnet_id =  aws_subnet.subnet-1.id
  vpc_security_group_ids = [aws_security_group.eng130-osman-terraform-sg.id]
  tags = {
    Name = "eng130-osman-terraform-app"
  }
  
}