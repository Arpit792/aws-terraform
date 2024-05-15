# modules/network/variables.tf
variable "cidr_block" {
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_cidr_block" {
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_cidr_block" {
  type        = string
  default     = "10.0.2.0/24"
}

variable "availability_zone" {
  type        = string
  default     = "us-west-2a"
}