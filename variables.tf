variable "access_key_id" {
  description = "AWS Access key id"
  type        = string
  sensitive   = true
}

variable "secret_access_key" {
  description = "AWS Secret key id"
  type        = string
  sensitive   = true
}

variable "oauth_token_id" {
  description = "Github token"
  type        = string
  sensitive   = true
}
