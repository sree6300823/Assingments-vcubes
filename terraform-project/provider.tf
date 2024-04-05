terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.41.0"
    }
  }
}
# Configure the AWS Provider
provider "aws" {
 region = var.region
 access_key = var.access_key
 secret_key = var.secret_key
}
# vpc create
resource "aws_vpc" "vcube" {
  cidr_block = var.vpc_id
  tags = {
    Name= "vpc"
  }
}
# us-west-1a
resource "aws_subnet" "public1" {
  vpc_id     = aws_vpc.vcube.id
  cidr_block = var.public1-cidr_block
 availability_zone = var.zone-1
 map_public_ip_on_launch = true
  tags = {
    Name = "public1"
  }
}
resource "aws_subnet" "private1" {
  vpc_id     = aws_vpc.vcube.id
  cidr_block = var.private1-cidr_block
 availability_zone = var.zone-1
  tags = {
    Name = "private1"
  }
}
resource "aws_subnet" "private3" {
  vpc_id     = aws_vpc.vcube.id
  cidr_block = var.private3-cidr_block
 availability_zone = var.zone-1
  tags = {
    Name = "private2"
  }
}
# us-west-1b

resource "aws_subnet" "public2" {
  vpc_id     = aws_vpc.vcube.id
  cidr_block = var.public2-cidr_block
 availability_zone = var.zone-2
 map_public_ip_on_launch = true
  tags = {
    Name = "public2"
  }
}
resource "aws_subnet" "private2" {
  vpc_id     = aws_vpc.vcube.id
  cidr_block = var.private2-cidr_block
 availability_zone = var.zone-2
  tags = { 
    Name = "private3"
  }
}
resource "aws_subnet" "private4" {
  vpc_id     = aws_vpc.vcube.id
  cidr_block = var.private4-cidr_block
  availability_zone = var.zone-2
  tags = {
    Name = "private4"
  }
}