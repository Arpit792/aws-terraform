# variables.tf
variable "region" {
  type    = string
  default = "us-west-2"
}
variable "db_password" {
  type = string
}