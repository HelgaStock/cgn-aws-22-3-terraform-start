terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-west-2"
}

resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "My VPC"
  }
}

resource "aws_subnet" "private_subnet_1" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = "Private 1"
  }
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = "10.0.2.0/24"
  tags = {
    Name = "Private 2"
  }
}
