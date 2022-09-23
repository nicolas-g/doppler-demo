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

# Define our data source to fetch secrets
data "doppler_secrets" "this" {
  project = "demo"
  config  = "dev"
}

# Access individual secrets
output "my_secret" {
  # nonsensitive used for demo purposes only
  value = nonsensitive(data.doppler_secrets.this.map.DEMO_SECRET)
}
