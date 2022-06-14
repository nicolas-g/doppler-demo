# export TF_VAR_DOPPLER_TOKEN='dp.st.dev.XYZ'

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
variable "DOPPLER_TOKEN" {
  type        = string
  description = "A token to authenticate with Doppler"
}

# Configure the Doppler provider with the token
provider "doppler" {
  doppler_token = var.DOPPLER_TOKEN
}

# Define our data source to fetch secrets
data "doppler_secrets" "this" {}

# Access individual secrets
output "my_secret" {
  # nonsensitive used for demo purposes only
  value = nonsensitive(data.doppler_secrets.this.map.HELLO_SECRET)
}
