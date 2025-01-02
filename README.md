![ci](https://github.com/LogisticsPet/terraform-gitops-repo/actions/workflows/ci.yml/badge.svg?branch=main)
![lint](https://github.com/LogisticsPet/terraform-gitops-repo/actions/workflows/lint.yml/badge.svg?branch=main)
![sec](https://github.com/LogisticsPet/terraform-gitops-repo/actions/workflows/tfsec.yml/badge.svg?branch=main)
## Introduction
Terraform module to create GitOps repo

<!-- BEGIN_TF_DOCS -->
  
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | 1.10.3 |
| <a name="requirement_github"></a> [github](#requirement\_github) | 6.4.0 |
| <a name="requirement_local"></a> [local](#requirement\_local) | 2.5.2 |
## Providers

| Name | Version |
|------|---------|
| <a name="provider_github"></a> [github](#provider\_github) | 6.4.0 |
| <a name="provider_local"></a> [local](#provider\_local) | 2.5.2 |
## Modules

No modules.
## Resources

| Name | Type |
|------|------|
| [github_branch_default.default_branch](https://registry.terraform.io/providers/integrations/github/6.4.0/docs/resources/branch_default) | resource |
| [github_repository.gitops_repo](https://registry.terraform.io/providers/integrations/github/6.4.0/docs/resources/repository) | resource |
| [github_repository_file.files](https://registry.terraform.io/providers/integrations/github/6.4.0/docs/resources/repository_file) | resource |
| [github_repository_file.readme](https://registry.terraform.io/providers/integrations/github/6.4.0/docs/resources/repository_file) | resource |
| [local_file.template_files](https://registry.terraform.io/providers/hashicorp/local/2.5.2/docs/data-sources/file) | data source |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_platform"></a> [platform](#input\_platform) | Stack name | `string` | n/a | yes |
| <a name="input_stage"></a> [stage](#input\_stage) | Stack name | `string` | `null` | no |
| <a name="input_template_variables"></a> [template\_variables](#input\_template\_variables) | Set of variables for templates | <pre>object({<br/>    argo_namespace = string<br/>    project_name   = string<br/>    apps = map(object({<br/>      name      = string<br/>      namespace = string<br/>      values    = string<br/>    }))<br/>    objects = map(string)<br/>  })</pre> | n/a | yes |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_http_url"></a> [http\_url](#output\_http\_url) | Http url of created repository |
<!-- END_TF_DOCS -->
