resource "aws_security_group" "webSg" {
  name   = var.public_sg
  vpc_id = aws_vpc.vcube.id

  ingress {
    description = "HTTP from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Web-sg"
  }
}

    

resource "aws_instance" "webserver1" {
  ami                    = var.ami_image
  instance_type          = var.instance_type
  key_name = var.key_name
  vpc_security_group_ids = [ aws_security_group.webSg.id ]
  subnet_id              = aws_subnet.public1.id
  user_data              =file("user.sh")
  tags = {
    name = "web-1"
  }
}

resource "aws_instance" "webserver2" {
  ami                    = var.ami_image
  instance_type          = var.instance_type
  key_name = var.key_name
  vpc_security_group_ids = [aws_security_group.webSg.id]
  subnet_id              = aws_subnet.public2.id
  user_data              = file("user1.sh")
  tags = {
    name = "web-2"
  }
}
# target-group
resource "aws_lb_target_group" "tg" {
  name     = var.target_name
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vcube.id
}

resource "aws_lb_target_group_attachment" "attach1" {
  count            = 2
  target_group_arn = aws_lb_target_group.tg.arn
  target_id        = element([aws_instance.webserver1.id, aws_instance.webserver2.id], count.index)
  port = 80
}

#create alb
resource "aws_lb" "myalb" {
  name               = var.myalb
  internal           = false
  load_balancer_type = "application"
  security_groups = [aws_security_group.webSg.id]
  subnets         = [aws_subnet.public1.id, aws_subnet.public2.id]
  tags = {
    Name = "web"
  }
}

resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.myalb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.tg.arn
    type             = "forward"
  }
}
resource "aws_security_group" "private" {
  name   = var.private-sg
  vpc_id = aws_vpc.vcube.id

  ingress {
    description = "HTTP from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "SSH"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "private-sg"
  }
}
resource "aws_instance" "private-1" {
  ami                    = var.ami_image
  instance_type          = var.instance_type
  key_name = var.key_name
  vpc_security_group_ids = [ aws_security_group.private.id ]
  subnet_id              = aws_subnet.private1.id
  user_data              =file("private.sh")
  tags = {
    name = "private-1"
  }
}

output "loadbalancerdns" {
  value = aws_lb.myalb.dns_name
}
