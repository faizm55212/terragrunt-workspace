remote_state {
  backend  = "local" 
  config   = {
    path   = "/kubeLab/boutiqueShop-demo/${path_relative_to_include()}/terraform.tfstate"
  }
}
