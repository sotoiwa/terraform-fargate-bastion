resource "aws_route_table" "private" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "${var.app_name}-private-route-table"
  }
}

resource "aws_route_table" "isolated" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "${var.app_name}-isolated-route-table"
  }
}

resource "aws_route_table_association" "private_a" {
  subnet_id      = aws_subnet.private_a.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private_c" {
  subnet_id      = aws_subnet.private_c.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "isolated_a" {
  subnet_id      = aws_subnet.isolated_a.id
  route_table_id = aws_route_table.isolated.id
}

resource "aws_route_table_association" "isolated_c" {
  subnet_id      = aws_subnet.isolated_c.id
  route_table_id = aws_route_table.isolated.id
}
