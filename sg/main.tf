resource "huaweicloud_networking_secgroup" "this" {
  name        = var.name
  description = var.description
  delete_default_rules = true
}

resource "huaweicloud_networking_secgroup_rule" "this" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = huaweicloud_networking_secgroup.this.id
}

resource "huaweicloud_networking_secgroup_rule" "this2" {
  direction         = "egress"
  ethertype         = "IPv4"
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = huaweicloud_networking_secgroup.this.id
}
