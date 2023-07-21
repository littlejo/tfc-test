resource "tfe_workspace" "test" {
  name         = "my-workspace-name"
  organization = "test-jli2"
  tag_names    = ["test", "app"]
}
