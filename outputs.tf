output public_ip {
  value = module.ecs.public_ip
}

output rds_private_ip {
  value = module.rds.private_ip
}

output redis_private_ip {
  value = module.redis.private_ip
}

output kubeconfig {
  value = module.k8s.kubeconfig
}
