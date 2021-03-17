data "huaweicloud_availability_zones" "myaz" {}

resource "huaweicloud_cce_cluster" "this" {
  name                   = var.name
  flavor_id              = "cce.s1.small"
  vpc_id                 = var.vpc_id
  subnet_id              = var.subnet_id
  container_network_type = "overlay_l2"
}

resource "huaweicloud_cce_node_pool" "node_pool" {
  cluster_id               = huaweicloud_cce_cluster.this.id
  name                     = "test"
  os                       = "EulerOS 2.5"
  initial_node_count       = 1
  flavor_id                = var.flavor
  availability_zone        = data.huaweicloud_availability_zones.myaz.names[0]
  key_pair                 = var.public_key_name
  scall_enable             = true
  min_node_count           = 1
  max_node_count           = 10
  scale_down_cooldown_time = 100
  priority                 = 1
  type                     = "vm"

  root_volume {
    size       = 40
    volumetype = "SAS"
  }
  data_volumes {
    size       = 100
    volumetype = "SAS"
  }
}
