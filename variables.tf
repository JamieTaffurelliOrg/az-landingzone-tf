variable "billing_account_name" {
  type        = string
  description = "The name of the billing account to attach to subscriptions"
}

variable "billing_profile_name" {
  type        = string
  description = "The name of the billing profile to attach to subscriptions"
}

variable "invoice_section_name" {
  type        = string
  description = "The name of the invoice section to attach to subscriptions"
}

variable "org_management_group_name" {
  type        = string
  description = "The name of the organsation management group"
}

variable "management_group_name_prefix" {
  type        = string
  description = "The prefix to give to the management groups created, e.g, 'mg-jt'"
}

variable "landing_zones" {
  type = list(object({
    name          = string
    subscriptions = list(string)
    management_groups = list(object({
      name          = string
      subscriptions = list(string)
    }))
  }))
  description = "Landing zones management groups and subscriptions"
}

variable "sandbox_subscriptions" {
  type        = list(string)
  default     = []
  description = "Sandbox subscriptions"
}

variable "policy_managed_identity_location" {
  type        = string
  description = "The location of the managed identity to attach to policies"
}
