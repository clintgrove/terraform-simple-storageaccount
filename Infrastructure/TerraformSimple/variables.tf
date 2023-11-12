variable "location" {
  type        = string
  description = "(Optional) The location for resource deployment"
  default     = "uksouth"
}

variable "resourcegroup" {
  type = string
  default = "rg"
  description = "used for getting rg"
}

variable "envvar" {
  type = string
  default = ""
  description = "which is it test dev or ppe"
}

variable "client_id" {
  type = string
}
variable "client_secret" {
  type =  string
}
variable "tenant_id" {
  type = string
}
variable "subscription_id" {
  type = string
}
