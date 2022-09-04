resource "github_repository_file" "python_test" {
  for_each            = toset(data.github_repositories.python.names)
  repository          = each.key
  branch              = "main"
  file                = ".github/workflows/python-test.yml"
  content             = file("./workflows/python-test.yml")
  commit_message      = "Update python-test.yml"
  commit_author       = "actions"
  commit_email        = "actions@github.com"
  overwrite_on_create = true
}

resource "github_repository_file" "python_publish" {
  for_each            = toset(data.github_repositories.python.names)
  repository          = each.key
  branch              = "main"
  file                = ".github/workflows/python-publish.yml"
  content             = file("./workflows/python-publish.yml")
  commit_message      = "Update python-publish.yml"
  commit_author       = "actions" 
  commit_email        = "actions@github.com"
  overwrite_on_create = true
}