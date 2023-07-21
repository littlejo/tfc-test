resource "tfe_organization" "this" {
  name  = "my-org-name-jli"
  email = "admin@company.com"
}

resource "tfe_workspace" "test" {
  name         = "my-workspace-name"
  organization = tfe_organization.this.name
  tag_names    = ["test", "app"]
}
