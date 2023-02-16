variable "region" {
  type        = string
  description = "describe your region"
}

variable "service" {
  type        = list(string)
  description = "service to which role will be given."
}
variable "role_name" {
  type        = string
  description = "role_name"
}
variable "policy_name" {
  type        = string
  description = "policy_name"
}
variable "profile_name" {
  type        = string
  description = "profile_name"
}
variable "policy_action" {
  type        = list(string)
  description = "policy_action to be given."
}
variable "policy_attachment_name" {
  type        = string
  description = "policy_attachment_name."
}

variable "role_arn" {
  type        = string
  description = "role of the account."
}
