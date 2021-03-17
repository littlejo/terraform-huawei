output public_ip {
  value = module.ecs.public_ip
}

output rds_private_ip {
  value = module.rds.private_ip
}
