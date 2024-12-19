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
  default     = null
}

variable "template_variables" {
  type        = object({
    argo_namespace = string
    project_name = string
    apps = list(object({
      certmanager = object({
        service_account_name = string
        service_account_annotations = map(string)
      })
    }))
  })
  description = "Set of variables for templates"
}
