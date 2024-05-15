# modules/jump_server/main.tf
resource "aws_instance" "this" {
  ami           = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.this.id]
  subnet_id = var.public_subnet
  key_name               = var.key_name
}

resource "aws_security_group" "this" {
  name        = "jump-server-sg"
  description = "Security group for jump server"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}