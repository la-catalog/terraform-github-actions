resource "github_repository_file" "terraform_fmt" {
  for_each            = toset(data.github_repositories.terraform.names)
  repository          = each.key
  branch              = "main"
  file                = ".github/workflows/terraform_fmt.yml"
  content             = file("./res/terraform_fmt.yml")
  commit_message      = "Update terraform-fmt.yml"
  commit_author       = "actions"
  commit_email        = "actions@github.com"
  overwrite_on_create = true

  lifecycle {
    ignore_changes = [
      commit_message,
      commit_author,
      commit_email
    ]
  }
}

resource "github_repository_file" "terraform_apply" {
  for_each            = toset(data.github_repositories.terraform.names)
  repository          = each.key
  branch              = "main"
  file                = ".github/workflows/terraform_apply.yml"
  content             = file("./res/terraform_apply.yml")
  commit_message      = "Update terraform-apply.yml"
  commit_author       = "actions"
  commit_email        = "actions@github.com"
  overwrite_on_create = true

  lifecycle {
    ignore_changes = [
      commit_message,
      commit_author,
      commit_email
    ]
  }
}