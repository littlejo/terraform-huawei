data "huaweicloud_dcs_az" "this" {
  code = var.az
}

resource "huaweicloud_dcs_instance" "this" {
  name              = var.name
  engine            = "Redis"
  engine_version    = "5.0"
  password          = var.password
  capacity          = 2
  vpc_id            = var.vpc_id
  subnet_id         = var.subnet_id
  available_zones   = [data.huaweicloud_dcs_az.this.id]
  product_id        = var.flavor
  save_days         = 1
  backup_type       = "manual"
  begin_at          = "00:00-01:00"
  period_type       = "weekly"
  backup_at         = [1]
}
