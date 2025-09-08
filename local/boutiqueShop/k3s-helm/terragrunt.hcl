include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "git::https://github.com/faizm55212/terraform-bricks.git//k3sDocker/k3s-helm?ref=master"
}

dependency "nodes" {
  config_path  = "../k3s-nodes"
  skip_outputs = true
}