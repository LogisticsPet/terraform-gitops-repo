variable "platform" {
  type        = string
  description = "Stack name"
  validation {
    condition     = contains(["core", "app"], var.platform)
    error_message = "Variable can contain only 'core' or 'app' values"
  }
}

variable "stage" {
  type        = string
  description = "Stack name"
  default     = ""
}

variable "template_variables" {
  type        = map(string)
  description = "Set of variables for templates"
  default = {
    argoNamespace      = "argocd",
    projectName        = "project",
    serviceAccountName = "test"
  }
}
