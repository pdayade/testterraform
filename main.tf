terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
provider "aws" {
    region = "us-east-1"
  
}
resource "aws_vpc" "main" {
  cidr_block = "20.20.0.0/16"
  tags = {
    Name = "main"
  }
}
resource "aws_subnet" "1subnet" {
    vpc_id = aws_vpc.main.id
    cidr_block = "20.20.1.0/24"

    tags = {
        Name = "Public"  
    }
}
resource "aws_subnet" "2subnet" {
    vpc_id = aws_vpc.main.id
    cidr_block = "20.20.2.0/24"

    tags = {
        Name = "Private"  
    }
}

resource "aws_instance" "firstec2" {
    ami = "ami-05576a079321f21f8"
    instance_type = "t2.micro"

}
# # data "aws_ami" "myami" {
#     owners = ["amazon"]
#     most_recent = true

#     filter {
#         name = "name"
#         values = ["amzn2-ami-kernal-5.0**"]
#         }
# }