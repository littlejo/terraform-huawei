provider "huaweicloud" {
  region      = "ap-southeast-1"
}

terraform {
  required_providers {
    huaweicloud = {
      source = "huaweicloud/huaweicloud"
      version = "1.22.1"
    }
  }
}
