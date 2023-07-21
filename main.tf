resource "tfe_workspace" "test" {
  name         = "my-workspace-name"
  organization = "test-jli2"
  tag_names    = ["test", "app"]
}

module "my_workspace" {
  source  = "flowingis/workspace/tfe"
  version = "0.5.0"

  name         = "my-workspace-name"
  organization = "my-organization"
  description  = "Advanced workspace with remote run mode"

  terraform_version = "1.3.7"

  queue_all_runs            = false
  working_directory         = "/"
  vcs_repository_identifier = "littlejo/tfc-guide-example"
  vcs_repository_branch     = "master"

  oauth_token_id = var.oauth_token_id #NOTE: sensitive value

  terraform_variables = {
    environment = "core"
    project     = "core"
    region      = "us-east-1"
  }

  environment_sensitive_variables = {
    AWS_ACCESS_KEY_ID     = var.access_key_id     #NOTE: sensitive value
    AWS_SECRET_ACCESS_KEY = var.secret_access_key #NOTE: sensitive value
  }

  variables_descriptions = {
    environment           = "The environment of the project"
    project               = "The name of the project"
    region                = "The AWS region where shared resources are deployed"
    AWS_ACCESS_KEY_ID     = "Access Key ID to access AWS Account"
    AWS_SECRET_ACCESS_KEY = "Secret Access Key to access AWS Account"
  }

  tag_names = [
    "project:core",
    "environment:core",
    "region:eu-west-1"
  ]
}
