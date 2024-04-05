variable "region" {
  type = string
}
variable "access_key" {
  type = string
}
variable "secret_key" {
  type = string
}
# 
variable "ami_image" {
  type = string
}
variable "instance_type" {
  type = string
}
variable "key_name" {
  type = string
}
variable "public_sg" {
  type = string 
}
variable "private-sg" {
 type = string 
}
# 
variable "vpc_id" {
  type =  string
}
variable "zone-1" {
  type = string
}
variable "public1-cidr_block" {
 type =  string
}

variable "private1-cidr_block" {
  type = string
}
variable "private3-cidr_block" {
  type = string
}
variable "zone-2" {
  type = string
}
variable "public2-cidr_block" {
 type =  string
}

variable "private2-cidr_block" {
  type = string
}
variable "private4-cidr_block" {
  type = string
}
# 
variable "target_name" {
  type = string
}
variable "myalb" {
  type = string
}
# 
variable "rds_name" {
  type = string
}
variable "rds_sg" {
  type = string
}
variable "" {
}
# 
variable "instance_class" {
  type = string
}
variable "engine" {
  type = string
}
variable "engine_version" {
  type = string
}


variable "identifier" {
  type = string
}
variable "username" {
  type = string
}
variable "password" {
  type = string
}