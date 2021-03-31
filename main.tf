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
  public_key_name = var.public_key_name
  security_groups = [module.ssh.name]
}

module postgres_sg {
  source = "./sg"
  name = "postgres"
  port = "5432"
  remote_ip_prefix = var.cidr
}

module rds {
  source = "./rds"
  name = "rds_test"
  password = "Joseph!120521"
  subnet_id = module.vpc.subnet_id
  vpc_id = module.vpc.vpc_id
  sg_id = module.postgres_sg.id
}

module redis {
  source = "./dcs"
  name = "dcs_test"
  password = "Huawei_test"
  vpc_id = module.vpc.vpc_id
  subnet_id = module.vpc.subnet_id
  region_ch = var.region_ch
}

module k8s {
  source = "./cce"
  name = "k8s-test"
  vpc_id = module.vpc.vpc_id
  subnet_id = module.vpc.subnet_id
  public_key_name = var.public_key_name
}
