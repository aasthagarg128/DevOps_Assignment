module "network" {
  source = "./modules/network"
}

module "security" {
  source = "./modules/security"
  vpc_id = module.network.vpc_id
}

module "compute" {
  source = "./modules/compute"

  vpc_id            = module.network.vpc_id
  public_subnet_id  = module.network.public_subnet_id
  private_subnet_id = module.network.private_subnet_id

  api_sg_id     = module.security.api_sg_id
  worker_sg_id  = module.security.worker_sg_id

  instance_type = var.instance_type
  worker_count  = var.worker_count
  key_name      = var.key_name
}