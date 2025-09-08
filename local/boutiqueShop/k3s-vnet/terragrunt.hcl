include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source   = "git::https://github.com/faizm55212/terraform-bricks.git//k3sDocker/k3s-vnet?ref=master"
}

inputs = {
  vpc_name            = "prepod-net"
  ipam_config         = [
    {
      subnet          = "10.0.0.0/21"
      gateway         = "10.0.0.1"
      ip_range        = "10.0.2.0/24"
    }
  ]
  labels              = [
    {
      label           = "owner"
      value           = "faiz"
    }
  ]
  pods_subnet_cidr    = "10.0.4.0/22"
  service_subnet_cidr = "10.0.0.0/23"
  #CIDR Range Left is 10.0.3.0/24
}
