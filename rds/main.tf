resource "huaweicloud_rds_instance" "instance" {
  availability_zone = var.az
  db {
    password = var.password
    type     = "PostgreSQL"
    version  = "10"
    port     = var.port
  }
  name              = var.name
  security_group_id = var.sg_id
  subnet_id         = var.subnet_id
  vpc_id            = var.vpc_id
  volume {
    type = "ULTRAHIGH"
    size = 50
  }
  flavor = var.flavor
  backup_strategy {
    start_time = "08:00-09:00"
    keep_days  = 1
  }
}
