module vpc {
  source = "./vpc"
}

module ssh {
  source = "./sg"
}

module ecs {
  source = "./ecs"
  subnet_id = module.vpc.subnet_id
  public_key = var.public_key
  security_groups = [module.ssh.name]
}


