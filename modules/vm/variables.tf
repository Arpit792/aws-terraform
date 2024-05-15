# modules/vm/variables.tf
variable "ami" {
  type        = string
  default     = "ami-01cd4de4363ab6ee8"
}

variable "instance_type" {
  type        = string
  default     = "t2.micro"
}

variable "vpc_id" {
  type        = string
}

variable "subnet_id" {
  type        = string
}

variable "key_name" {
  type        = string
}