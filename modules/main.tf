# main.tf
module "network" {
  source = "../modules/network"
}

module "jump_server" {
  source        = "../modules/jump_server"
  vpc_id        = module.network.vpc_id
  public_subnet = module.network.public_subnets[0]
  key_name      = "test-key"
}

module "load_balancer" {
  source         = "../modules/load_balancer"
  public_subnets = module.network.public_subnets
  vpc_id         = module.network.vpc_id
}

module "database_instance" {
  source          = "../modules/database_instance"
  vpc_id          = module.network.vpc_id
  private_subnets = module.network.private_subnets
  password        = var.db_password
}

module "vm" {
  source    = "../modules/vm"
  vpc_id    = module.network.vpc_id
  subnet_id = module.network.private_subnets[0]
  key_name  = "my-key-pair"
}