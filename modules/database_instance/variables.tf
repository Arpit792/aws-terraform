# modules/database_instance/variables.tf
variable "instance_class" {
  type        = string
  default     = "db.t2.micro"
}

variable "engine" {
  type        = string
  default     = "postgres"
}

variable "engine_version" {
  type        = string
  default     = "12.7"
}

variable "db_name" {
  type        = string
  default     = "mydatabase"
}

variable "username" {
  type        = string
  default     = "myuser"
}

variable "password" {
  type        = string
  sensitive   = true
}

variable "vpc_id" {
  type        = string
}

variable "private_subnets" {
  type        = list(string)
}