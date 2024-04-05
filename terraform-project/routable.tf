# internet gatwey
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vcube.id
  tags = {
    Name = "igw"
  }
}
# rout_table (public)
resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.vcube.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
}
##
# create route table association (public)

resource "aws_route_table_association" "sg01" {
  subnet_id      = aws_subnet.public1.id
  route_table_id = aws_route_table.route_table.id
}

resource "aws_route_table_association" "sg02" {
  subnet_id      = aws_subnet.public2.id
  route_table_id = aws_route_table.route_table.id
}

# natgatway create
# create eip
resource "aws_eip" "eip01" {
  vpc= true
}
# nat gatway (public-01)us-west-2a
resource "aws_nat_gateway" "nat01" {
  allocation_id = aws_eip.eip01.id
  subnet_id     =aws_subnet.public1.id 
  tags = {
    Name = "NAT-2a"
  }
}
#  create eip

resource "aws_eip" "eip02" {
 vpc = true
}

# nat gatway (public-02)us-west-2b
resource "aws_nat_gateway" "nat02" {
  allocation_id = aws_eip.eip02.id
  subnet_id     =aws_subnet.public2.id 
  tags = {
    Name = "NAT-2b"
  }
}
# #### rout_table (private-1)
resource "aws_route_table" "private1" {
  vpc_id = aws_vpc.vcube.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat01.id
  }
}
resource "aws_route_table_association" "rout-ass-pri01" {
  subnet_id      = aws_subnet.private1.id
  route_table_id = aws_route_table.private1.id
}

# rout_table (private-2)
resource "aws_route_table" "private2" {
  vpc_id = aws_vpc.vcube.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat01.id
  }
}
resource "aws_route_table_association" "rout-ass-pri02" {
  subnet_id      = aws_subnet.private2.id
  route_table_id = aws_route_table.private2.id
}
# rout_table (private-3)
resource "aws_route_table" "private3" {
  vpc_id = aws_vpc.vcube.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id =aws_nat_gateway.nat02.id
  }
}
resource "aws_route_table_association" "rout-ass-pri03" {
  subnet_id      = aws_subnet.private3.id
  route_table_id =aws_route_table.private3.id
}

# rout_table (private-4)
resource "aws_route_table" "private4" {
  vpc_id = aws_vpc.vcube.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat02.id
  }
}
#######
# route-table association
resource "aws_route_table_association" "rout-ass-pri04" {
  subnet_id      = aws_subnet.private4.id
  route_table_id = aws_route_table.private4.id
}