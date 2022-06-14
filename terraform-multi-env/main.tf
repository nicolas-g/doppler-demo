
terraform {
  required_providers {
    doppler = {
      source  = "DopplerHQ/doppler"
      version = "1.0.0"
    }
  }
}

variable "doppler_token_dev" {
  type        = string
  description = "A token to authenticate with Doppler for the dev config"
}

variable "doppler_token_prd" {
  type        = string
  description = "A token to authenticate with Doppler for the prd config"
}

provider "doppler" {
  doppler_token = var.doppler_token_dev
  alias         = "dev"
}

provider "doppler" {
  doppler_token = var.doppler_token_prd
  alias         = "prd"
}

data "doppler_secrets" "dev" {
  provider = doppler.dev
}

data "doppler_secrets" "prd" {
  provider = doppler.prd
}

output "port-dev" {
  value = nonsensitive(data.doppler_secrets.dev.map.PORT)
}

output "port-prd" {
  value = nonsensitive(data.doppler_secrets.prd.map.PORT)
}
