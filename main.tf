data "tfe_organization" "this" {
  name = "test-jli2"
}

resource "tfe_workspace" "test" {
  name         = "my-workspace-name"
  organization = data.tfe_organization.this.name
  tag_names    = ["test", "app"]
}
