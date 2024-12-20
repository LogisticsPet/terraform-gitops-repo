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
      values    = object({})
    }))
  })
  default = {
    argo_namespace = "string"
    project_name   = "string"
    apps = {
      "certmanager" = {
        name      = "cert-manager"
        namespace = "cert-m=ns"
        values = {
          installCRDs = true
          serviceAccount = {
            name = "test_role"
            annotations = {
              "eks.amazonaws.com/role-arn" : "arn"
              "eks.amazonaws.com/sts-regional-endpoints" = true
            }
          }
        }
      },
      "ingress" = {
        namespace = "ing-m=ns"
        name      = "ingress"
        values = {
          installCRDs = true
          serviceAccount = {
            name = "test_role"
            annotations = {
              "eks.amazonaws.com/role-arn" : "arn"
              "eks.amazonaws.com/sts-regional-endpoints" = true
            }
          }
        }
      }
    }
  }
  description = "Set of variables for templates"
}
