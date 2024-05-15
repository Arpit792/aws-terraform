# modules/database_instance/main.tf
resource "aws_db_instance" "this" {
  instance_class      = var.instance_class
  engine              = var.engine
  engine_version      = var.engine_version
  db_name             = var.db_name
  username            = var.username
  password            = var.password
  vpc_security_group_ids = [aws_security_group.this.id]
  db_subnet_group_name = aws_db_subnet_group.this.name
}

resource "aws_security_group" "this" {
  name        = "database-sg"
  description = "Security group for database instance"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_subnet_group" "this" {
  name        = "database-subnet-group"
  description = "Subnet group for database instance"
  subnet_ids = var.private_subnets
}
