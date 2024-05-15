# modules/load_balancer/variables.tf
variable "public_subnets" {
  type        = list(string)
}

variable "vpc_id" {
  type        = string
}