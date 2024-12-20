locals {
  name                = var.stage != null ? var.stage : var.platform
  template_base_path  = "${path.module}/templates/${var.platform}"
  all_files_with_dirs = fileset(local.template_base_path, "/**")
  filtered_files      = [for file in local.all_files_with_dirs : file if !can(regex("/$", file))]
}

resource "github_repository" "gitops_repo" {
  name                      = "${local.name}-stack-gitops"
  has_discussions           = false
  has_downloads             = false
  has_issues                = false
  has_projects              = false
  has_wiki                  = false
  allow_merge_commit        = false
  allow_squash_merge        = true
  allow_rebase_merge        = false
  squash_merge_commit_title = "PR_TITLE"
  delete_branch_on_merge    = true
  auto_init                 = true
  visibility                = "public"
}

resource "github_branch_default" "default_branch" {
  branch     = "main"
  repository = github_repository.gitops_repo.name
}


resource "github_repository_file" "readme" {
  repository          = github_repository.gitops_repo.name
  file                = "README.md"
  content             = "${local.name} platfrom GitOps repository for ArgoCD"
  overwrite_on_create = true
  branch              = github_branch_default.default_branch.branch
}

data "local_file" "template_files" {
  for_each = toset(local.filtered_files)
  filename = "${local.template_base_path}/${each.value}"
}

resource "github_repository_file" "files" {
  for_each   = data.local_file.template_files
  repository = github_repository.gitops_repo.name
  file       = each.key
  branch     = github_branch_default.default_branch.branch
  content = templatefile("${local.template_base_path}/${each.key}", {
    repo          = github_repository.gitops_repo.http_clone_url
    template_vars = var.template_variables
  })
}

# resource "github_repository_file" "values" {
#   for_each       = var.template_variables.apps
#   repository     = github_repository.gitops_repo.name
#   file           = "values/${each.value.name}.yml"
#   content        = each.value.values
#   branch         = github_branch_default.default_branch.branch
#   commit_message = "Add values file for ${each.key}"
# }
