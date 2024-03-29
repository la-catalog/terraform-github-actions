resource "github_repository_file" "python_test" {
  for_each            = toset(data.github_repositories.python.names)
  repository          = each.key
  branch              = "main"
  file                = ".github/workflows/python_test.yml"
  content             = file("./res/python_test.yml")
  commit_message      = "Update python-test.yml"
  commit_author       = "github-actions"
  commit_email        = "github-actions[bot]@users.noreply.github.com"
  overwrite_on_create = true

  lifecycle {
    ignore_changes = [
      commit_message,
      commit_author,
      commit_email
    ]
  }
}

resource "github_repository_file" "python_update" {
  for_each            = toset(data.github_repositories.python.names)
  repository          = each.key
  branch              = "main"
  file                = ".github/workflows/python_update.yml"
  content             = file("./res/python_update.yml")
  commit_message      = "Update python-update.yml"
  commit_author       = "github-actions"
  commit_email        = "github-actions[bot]@users.noreply.github.com"
  overwrite_on_create = true

  lifecycle {
    ignore_changes = [
      commit_message,
      commit_author,
      commit_email
    ]
  }
}

resource "github_repository_file" "python_publish" {
  for_each            = toset(data.github_repositories.python_package.names)
  repository          = each.key
  branch              = "main"
  file                = ".github/workflows/python_publish.yml"
  content             = file("./res/python_publish.yml")
  commit_message      = "Update python-publish.yml"
  commit_author       = "github-actions"
  commit_email        = "github-actions[bot]@users.noreply.github.com"
  overwrite_on_create = true

  lifecycle {
    ignore_changes = [
      commit_message,
      commit_author,
      commit_email
    ]
  }
}