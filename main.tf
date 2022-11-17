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
    resource "aws_instance"  "app_instance" {
     ami = "ami-0b47105e3d7fc023e"
     instance_type = "t2.micro"
     associate_public_ip_address = true
     tags = {
         Name = "eng130-osman-terraform-app"
     }
    }
# what type of servcer what functionality

# add resource
# ami
# instance type
# public ip or no?
# name the server
