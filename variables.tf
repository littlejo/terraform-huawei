variable public_key {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDQxB/T05Wu9OhAn/EMWf+pr8ScS0V3AaglB/lw2LHkluDQ3o2dPTvDsoUWgNdYYYrOEy0IOxJP/ePT+oGMouNO7pb5FbFteYsr7v8WWyb+E31APK7cMyWzfIO6GGu7qOENo1FqmFayTXoAmbB8XC5msiBrn2XHg++msNcm3itaID9pusF0Ik5d7FlZv4q/Wywd6otCjH4jbj6yKoLDDf7TW/ydFPqzvCThgyK8xfBC81d4oSwBsWMCQwhrUvAehTNjdA99IAQOS4hDKqrLcltEvLLvaLSImtRBJ4vG57mIfzopwQrsCoj6CEKdadtyZdhatyh82SYtT8LHTS0B4fuKw7DfD2Tjl15QhbZaPAqv8/Epr9nQq2+CI3s1cFxA/HG5xU3dDLQXuc9iMhci8D6a8OJEvD1O8XZGjW3CWbyGG40M2apHjBcw4ADP3HhSu8hVivHszt07XnKL+bBwo3JqslHYtaW0ZoyhzEH3Y8jKRiuWYiCLZf3Caln4rlOih8k= cloud_user@2acf15a21d1c.mylabserver.com"
}

variable public_key_name {
  default = "my-keypair"
}

variable cidr {
  default = "10.0.0.0/16"
}

variable project {
  default = "test"
}

variable region_ch {
  default = "可用区" # fix in the next release: https://github.com/huaweicloud/terraform-provider-huaweicloud/pull/1016
}
