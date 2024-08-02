resource "aws_eip" "eip" {
  count  = 1
  domain = "vpc"
  tags = {
    Name = "${var.project_name}-eip"
  }
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.eip[0].id
  subnet_id     = element(aws_subnet.public.*.id, 0)

  tags = {
    Name = "${var.project_name}-nat"
  }
}
