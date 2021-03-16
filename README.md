* Add your access and secret key:

export HW_ACCESS_KEY="anaccesskey"
export HW_SECRET_KEY="asecretkey"

* modify public ssh key in variables.tf

* Deploy cloud:

terraform apply
[...]
> yes
[...]
public_ip = "W.X.Y.Z"

* Connect to the ecs:

ssh -i ~/.ssh/private_key root@W.X.Y.Z
