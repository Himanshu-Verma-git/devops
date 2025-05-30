resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  tags = {
    Name = "${var.project_name}-vpc"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "${var.project_name}-igw"
  }
}

resource "aws_subnet" "public" {
  for_each = var.public_subnets
  vpc_id                  = aws_vpc.main.id
  cidr_block              = each.value
  availability_zone       = each.key
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.project_name}-public-${each.key}"
  }
}

resource "aws_subnet" "private_app" {
  for_each = var.private_app_subnets
  vpc_id            = aws_vpc.main.id
  cidr_block        = each.value
  availability_zone = each.key
  map_public_ip_on_launch = false
  tags = {
    Name = "${var.project_name}-private-app-${each.key}"
  }
}

resource "aws_subnet" "private_db" {
  for_each = var.private_db_subnets
  vpc_id            = aws_vpc.main.id
  cidr_block        = each.value
  availability_zone = each.key
  tags = {
    Name = "${var.project_name}-private-db-${each.key}"
  }
}

resource "aws_eip" "nat" {
  for_each = aws_subnet.public
  depends_on = [aws_internet_gateway.igw]
}

resource "aws_nat_gateway" "nat" {
  for_each = aws_subnet.public
  allocation_id = aws_eip.nat[each.key].id
  subnet_id     = each.value.id
  tags = {
    Name = "${var.project_name}-nat-${each.key}"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "${var.project_name}-public-rt"
  }
}

resource "aws_route" "public_internet_access" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_route_table_association" "public" {
  for_each = aws_subnet.public
  subnet_id      = each.value.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table" "private_app" {
  for_each = aws_nat_gateway.nat
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "${var.project_name}-private-app-rt-${each.key}"
  }
}

resource "aws_route" "private_app_nat" {
  for_each = aws_nat_gateway.nat
  route_table_id         = aws_route_table.private_app[each.key].id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = each.value.id
}

resource "aws_route_table_association" "private_app" {
  for_each = aws_subnet.private_app
  subnet_id      = each.value.id
  route_table_id = aws_route_table.private_app[each.key].id
}

resource "aws_route_table" "private_db" {
  for_each = aws_subnet.private_db
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "${var.project_name}-private-db-rt-${each.key}"
  }
}

resource "aws_route_table_association" "private_db" {
  for_each = aws_subnet.private_db
  subnet_id      = each.value.id
  route_table_id = aws_route_table.private_db[each.key].id
}
