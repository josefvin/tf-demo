provider "aws" {
  region = "us-east-1"
}

module "secrets" {
  source = "./modules/secrets"
  secrets_map = var.secrets_map
}
