module "network" {
  source               = "../../modules/network"
  project_name         = var.project_name
  vpc_cidr             = var.vpc_cidr
  public_subnets       = var.public_subnets
  private_app_subnets  = var.private_app_subnets
  private_db_subnets   = var.private_db_subnets
}

module "compute" {
  source             = "../../modules/compute"
  project_name       = var.project_name
  ami_id             = var.ami_id
  instance_type      = var.instance_type
  key_name           = var.key_name
  web_sg_id          = var.web_sg_id
  public_subnet_ids  = module.network.public_subnet_ids
  min_size           = var.min_size
  max_size           = var.max_size
  desired_capacity   = var.desired_capacity
}