module vpc {
  source = "./vpc"
  name   = var.project
  cidr   = var.cidr
}

module ssh {
  source = "./sg"
  name   = "${var.project}-ssh"
}

module ecs {
  source = "./ecs"
  instance_name = var.project
  subnet_id = module.vpc.subnet_id
  public_key = var.public_key
  public_key_name = var.public_key_name
  security_groups = [module.ssh.name]
}

module postgres_sg {
  source = "./sg"
  name = "${var.project}-postgres"
  port = "5432"
  remote_ip_prefix = var.cidr
}

module rds {
  source = "./rds"
  name = "${var.project}-rds"
  password = "Joseph!120521"
  subnet_id = module.vpc.subnet_id
  vpc_id = module.vpc.vpc_id
  sg_id = module.postgres_sg.id
}

module redis {
  source = "./dcs"
  name = "${var.project}-dcs"
  password = "Huawei_test"
  vpc_id = module.vpc.vpc_id
  subnet_id = module.vpc.subnet_id
  region_ch = var.region_ch
}

module k8s {
  source = "./cce"
  name = "${var.project}-k8s"
  vpc_id = module.vpc.vpc_id
  subnet_id = module.vpc.subnet_id
  public_key_name = var.public_key_name
}

module elb {
  source = "./elb"
  vip_subnet_id = module.vpc.vip_subnet_id
  name = "${var.project}-elb"
}
