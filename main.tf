resource "tfe_workspace" "test" {
  name         = "my-workspace-name"
  organization = "org-mRX7Ax72ZPKwsYHi"
  tag_names    = ["test", "app"]
}
