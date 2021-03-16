resource "huaweicloud_vpc" "this" {
  name = var.name
  cidr = var.cidr
}

resource "huaweicloud_vpc_subnet" "this" {
  name       = var.name
  cidr       = var.cidr
  gateway_ip = var.gateway_ip
  vpc_id     = huaweicloud_vpc.this.id
}
