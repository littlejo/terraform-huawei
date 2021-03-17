resource "huaweicloud_networking_secgroup" "this" {
  name        = var.name
  description = var.description
  delete_default_rules = true
}

resource "huaweicloud_networking_secgroup_rule" "this" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = var.port
  port_range_max    = var.port
  remote_ip_prefix  = var.remote_ip_prefix
  security_group_id = huaweicloud_networking_secgroup.this.id
}

resource "huaweicloud_networking_secgroup_rule" "this2" {
  direction         = "egress"
  ethertype         = "IPv4"
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = huaweicloud_networking_secgroup.this.id
}
