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

resource "huaweicloud_nat_gateway" "this" {
  name                = "Terraform"
  description         = "test for terraform"
  spec                = "1"
  router_id           = huaweicloud_vpc.this.id
  internal_network_id = huaweicloud_vpc_subnet.this.id
}

resource "huaweicloud_vpc_eip" "this" {
  publicip {
    type = "5_bgp"
  }
  bandwidth {
    name        = "test"
    size        = 1
    share_type  = "PER"
    charge_mode = "traffic"
  }
}

resource "huaweicloud_nat_snat_rule" "this" {
  floating_ip_id = huaweicloud_vpc_eip.this.id
  nat_gateway_id = huaweicloud_nat_gateway.this.id
  network_id     = huaweicloud_vpc_subnet.this.id
}
