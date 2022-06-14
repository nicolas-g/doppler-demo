
# Automatically converts Doppler secrets to lowercase Terraform variables by running:
# $ doppler run --name-transformer tf-var -- terraform plan

# the above will transform the names of your Doppler secrets into Terraform environment variables
# For example, a variable named API_KEY will be converted into TF_VAR_api_key

variable "hello_secret" {
  type        = string
  description = "A secret var example"
}

output "secret_value" {
  value = var.hello_secret
}
