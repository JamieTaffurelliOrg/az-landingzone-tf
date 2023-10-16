output "org_management_group_id" {
  value       = azurerm_management_group.org.id
  description = "Resource ID of the organisation management group"
}

output "primary_management_group_ids" {
  value       = { for k, v in azurerm_management_group.primary_management_groups : k => v.id }
  description = "Resource IDs of the primary management groups"
}

output "platform_management_group_ids" {
  value       = { for k, v in azurerm_management_group.platform_management_groups : k => v.id }
  description = "Resource IDs of the platform management groups"
}

output "management_management_group_ids" {
  value       = { for k, v in azurerm_management_group.management_management_groups : k => v.id }
  description = "Resource IDs of the management management groups"
}

output "connectivity_management_group_ids" {
  value       = { for k, v in azurerm_management_group.connectivity_management_groups : k => v.id }
  description = "Resource IDs of the connectivity management groups"
}

output "identity_management_group_ids" {
  value       = { for k, v in azurerm_management_group.identity_management_groups : k => v.id }
  description = "Resource IDs of the identity management groups"
}

output "org_subscriptions" {
  value       = { for k, v in azurerm_subscription.org_subscriptions : k => v }
  description = "Properties of the organisation level subscriptions"
}

output "connectivity_subscriptions" {
  value       = { for k, v in azurerm_subscription.connectivity_subscriptions : k => v }
  description = "Properties of the connectivity subscriptions"
}

output "identity_subscriptions" {
  value       = { for k, v in azurerm_subscription.identity_subscriptions : k => v }
  description = "Properties of the identity subscriptions"
}

output "management_subscriptions" {
  value       = { for k, v in azurerm_subscription.management_subscriptions : k => v }
  description = "Properties of the management subscriptions"
}
