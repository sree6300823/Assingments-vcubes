resource "aws_db_subnet_group" "example" {
  name       = var.rds_name
  subnet_ids = [aws_subnet.private3.id,aws_subnet.private4.id]

  tags = {
    Name = "rds"
  }
}
resource "aws_db_instance" "example" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = var.engine 
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  identifier          = var.identifier
  username             = var.username
  password             = var.password
  vpc_security_group_ids = [aws_security_group.rds.id]
  db_subnet_group_name = aws_db_subnet_group.example.name
  skip_final_snapshot   = true
  publicly_accessible = false
  multi_az             = true
}
resource "aws_security_group" "rds" {
  name        = var.rds_sg
  description = "Security group for RDS instance"
  vpc_id      = aws_vpc.vcube.id

  // Allow inbound traffic on the database port from a specific IP address
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ] // Change this to your specific IP or CIDR block
  }

  // Allow outbound traffic to all destinations
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "rds_sg"
  }
}