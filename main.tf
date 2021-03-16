module vpc {
  source = "./vpc"
}

module ecs {
  source = "./ecs"
  subnet_id = module.vpc.subnet_id
  public_key = var.public_key
}


