# write a script to launch resources on cloud
# create ec2 instance on aws
# syntax {
#	  ami = djhwjusdh}
# download dependencies from aws
# 
    provider "aws" {

# which part of aws we would like to launch resources in - ireland?
	region = "eu-west-1"
    }
    # # create vpc
    resource "aws_vpc" "osman-vpc"{
        cidr_block = "10.0.9.0/24"

        tags = {
          "Name" = "Osman-vpc"
        }
    }

    # public subnet
    resource "aws_subnet" "eng130_osman_public_subnet" {
        vpc_id     = aws_vpc.
        cidr_block = "10.0.9.0/24"
        map_public_ip_on_launch = true
        availability_zone = "eu-west-1a"

        tags = {
            Name = "eng130_osman_subnet_public"
        }
    }
    # create internet gateway
    resource "aws_internet_gateway" "osman-ig"{

    }

    # route table




    resource "aws_instance"  "app_instance" {
     ami = var.ami_id
     instance_type = "t2.micro"
     associate_public_ip_address = true
     key_name = var.key_name
     tags = {
         Name = "eng130-osman-terraform-appv2"
     }
    }