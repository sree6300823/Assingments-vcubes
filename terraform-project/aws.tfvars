region          = "us-east-1"
access_key      = "AKIAXYKJP67ZROB3TRX2"
secret_key      =  "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"
ami_image       = "ami-07d9b9ddc6cd8dd30"
instance_type   = "t2.micro"
key_name        = "key_name"
public_sg       = "public"
private         ="private-sg"
# 
vpc_id          = [ "178.23.0.0/16" ]
zone-1  = "us-east-1a"
public1-cidr_block =["178.23.0.0/24"]
private1-cidr_block      = ["178.23.1.0/24"]
private3-cidr_block      =["178.23.2.0/24"]
zone-2       ="us-east-1b"
public2-cidr_block  =["178.23.4.0/24"]
private2-cidr_block =["178.23.5.0/24"]
private4-cidr_block  =["178.23.6.0/24"]
# 
target_name = "myTG1"
 myalb    = "myalb3"
# 
rds_name     ="rds123"
engine  = "mysql"
engine_version   = "8.0.35"
instance_class = "db.t3.micro"
identifier  ="mydb12"
username  ="admin"
password  ="AZadmin123"             
rds_sg   =  "rds_sg"            