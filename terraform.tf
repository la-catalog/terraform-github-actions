resource "github_repository_file" "terraform_fmt" {
  for_each            = toset(data.github_repositories.terraform.names)
  repository          = each.key
  branch              = "main"
  file                = ".github/workflows/terraform-fmt.yml"
  content             = file("./res/terraform-fmt.yml")
  commit_message      = "Update terraform-fmt.yml"
  commit_author       = "actions"
  commit_email        = "actions@github.com"
  overwrite_on_create    = true
}