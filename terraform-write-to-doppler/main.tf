# Install the Doppler provider
terraform {
  required_providers {
    doppler = {
      source  = "DopplerHQ/doppler"
      version = "1.0.0" # Always specify the latest version
    }
  }
}

# Define a variable so we can pass in our token
variable "doppler_token" {
  # export TF_VAR_doppler_token=dp.pt.XYZ
  description = "The Dooppler token to authenticate"
  type        = string
}

# Configure the Doppler provider with the token
provider "doppler" {
  # Configuration options
  doppler_token = var.doppler_token
}

# Generate a random password
resource "random_password" "db_password" {
  length  = 32
  special = true
}

# Save the random password to Doppler
resource "doppler_secret" "db_password" {
  project = "demo"
  config  = "dev"
  name    = "DB_PASSWORD"
  value   = random_password.db_password.result
}

# Access the secret value
output "resource_value" {
  # nonsensitive used for demo purposes only
  value = nonsensitive(doppler_secret.db_password.value)
}
