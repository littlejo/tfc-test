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

variable "oauth_token" {
  description = "github token"
  type        = string
  sensitive   = true
}

variable "organization" {
  description = "Which organization"
  type        = string
  default     = "test-jli2"
}

variable "workspace_data" {
  description = "workspace"
  type        = any
  default = {
    workspace_module = {
      name        = "my-workspace-name-module"
      description = "Advanced workspace with remote run mode"
    }
    vcs = {
      identifier = "littlejo/tfc-guide-example"
      branch     = "master"
    }
    tag_names = [
      "project:core",
      "environment:core",
      "region:eu-west-1"
    ]
  }
}
