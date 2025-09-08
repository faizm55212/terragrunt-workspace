include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  // local path for terraform-bricks
  source   = "git::https://github.com/faizm55212/terraform-bricks.git//k3sDocker/k3s-nodes?ref=master"
}


dependency "vnet" {
  config_path             = "../k3s-vnet"
  mock_outputs = {
    network_name          = "mock-network"
    node_subnet_cidr      = "10.0.0.0/16"
    pods_subnet_cidr      = "10.0.1.0/16"
    service_subnet_cidr   = "10.0.2.0/16"
  }
}

inputs = {
  control_plane_name      = "k3s-control-plane"
  control_plane_image     = "cgr.dev/chainguard/k3s:latest"
  control_plane_cpu_count = 1.5
  control_plane_mem_mb    = 2048
  worker_node_count       = 2
  worker_name_suffix      = "k3s-worker"
  worker_image            = "cgr.dev/chainguard/k3s:latest"
  worker_cpu_count        = "1"
  worker_mem_mb           = 1024
  vpc_name                = dependency.vnet.outputs.network_name
  node_subnet_cidr        = dependency.vnet.outputs.node_subnet_cidr
  pods_subnet_cidr        = dependency.vnet.outputs.pods_subnet_cidr
  service_subnet_cidr     = dependency.vnet.outputs.service_subnet_cidr
}
