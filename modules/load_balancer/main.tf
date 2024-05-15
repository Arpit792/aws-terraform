# modules/load_balancer/main.tf
resource "aws_elb" "this" {
  name            = "my-elb"
  subnets         = var.public_subnets
  security_groups = [aws_security_group.this.id]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }
}

resource "aws_security_group" "this" {
  name        = "elb-sg"
  description = "Security group for ELB"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}