generate "providers" {
  path      = "providers.default.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
        provider "null" {
            features {}
        }
EOF
}

dependency "1" {
  config_path = "../b"
}

remote_state {
  backend = "local"
  config = {
    path  = "${dependency.1.outputs.file_name}.tfstate"
  }

  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
}
