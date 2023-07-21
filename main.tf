data "github_release" "terraform" {
  repository  = "terraform"
  owner       = "hashicorp"
  retrieve_by = "latest"
}

resource "tfe_oauth_client" "test" {
  name             = "my-github-oauth-client"
  organization     = "test-jli2"
  api_url          = "https://api.github.com"
  http_url         = "https://github.com"
  oauth_token      = var.oauth_token
  service_provider = "github"
}

resource "tfe_workspace" "test" {
  name         = "my-workspace-name"
  organization = "test-jli2"
  tag_names    = ["test", "app"]
}

module "my_workspace" {
  source       = "flowingis/workspace/tfe"
  version      = "0.5.0"
  for_each     = var.workspace_data
  organization = var.organization

  name        = each.value.name
  description = each.value.description

  terraform_version = replace(data.github_release.terraform.release_tag, "v", "")

  working_directory         = "/"
  vcs_repository_identifier = each.value.vcs.identifier
  vcs_repository_branch     = each.value.vcs.branch

  oauth_token_id = tfe_oauth_client.test.oauth_token_id
  queue_all_runs = false

  terraform_variables = {
    region = "us-east-1"
  }

  environment_sensitive_variables = {
    AWS_ACCESS_KEY_ID     = var.access_key_id     #NOTE: sensitive value
    AWS_SECRET_ACCESS_KEY = var.secret_access_key #NOTE: sensitive value
  }

  variables_descriptions = {
    region                = "The AWS region where shared resources are deployed"
    AWS_ACCESS_KEY_ID     = "Access Key ID to access AWS Account"
    AWS_SECRET_ACCESS_KEY = "Secret Access Key to access AWS Account"
  }

  tag_names = each.value.tag_names
}
