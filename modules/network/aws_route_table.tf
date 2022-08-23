resource "aws_route_table" "private_a" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "${var.app_name}-private-route-table-a"
  }
}

resource "aws_route_table" "private_c" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "${var.app_name}-private-route-table-c"
  }
}

resource "aws_route_table" "isolated_a" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "${var.app_name}-isolated-route-table-a"
  }
}

resource "aws_route_table" "isolated_c" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "${var.app_name}-isolated-route-table-c"
  }
}

resource "aws_route_table_association" "private_a" {
  subnet_id      = aws_subnet.private_a.id
  route_table_id = aws_route_table.private_a.id
}

resource "aws_route_table_association" "private_c" {
  subnet_id      = aws_subnet.private_c.id
  route_table_id = aws_route_table.private_c.id
}

resource "aws_route_table_association" "isolated_a" {
  subnet_id      = aws_subnet.isolated_a.id
  route_table_id = aws_route_table.isolated_a.id
}

resource "aws_route_table_association" "isolated_c" {
  subnet_id      = aws_subnet.isolated_c.id
  route_table_id = aws_route_table.isolated_c.id
}
