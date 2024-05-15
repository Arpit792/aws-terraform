# modules/jump_server/variables.tf
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

variable "public_subnet" {
  type        = string
}

variable "key_name" {
  type        = string
}