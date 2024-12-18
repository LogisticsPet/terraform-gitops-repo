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
  type = object({
    argo_namespace = string
    project_name   = string
    apps = map(object({
      name      = string
      namespace = string
      values    = string
    }))
    objects = map(string)
  })
  description = "Set of variables for templates"
}
