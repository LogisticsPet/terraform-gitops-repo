output "http_url" {
  description = "Http url of created repository"
  value       = github_repository.gitops_repo.http_clone_url
}
