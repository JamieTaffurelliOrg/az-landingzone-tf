resource "azurerm_management_group" "org" {
  name         = var.org_management_group_name
  display_name = var.org_management_group_name
}

resource "azurerm_management_group_policy_assignment" "org" {
  for_each             = { for op in local.org_policies : op.name => op }
  name                 = each.key
  location             = var.policy_managed_identity_location
  policy_definition_id = each.value.id
  management_group_id  = azurerm_management_group.org.id
  identity {
    type = each.value.identity.type
  }
}

resource "azurerm_management_group" "primary_management_groups" {
  for_each                   = local.primary_management_groups
  name                       = "${var.management_group_name_prefix}-${each.value["name"]}"
  display_name               = "${var.management_group_name_prefix}-${each.value["name"]}"
  parent_management_group_id = azurerm_management_group.org.id
}

resource "azurerm_management_group" "platform_management_groups" {
  for_each                   = local.platform_management_groups
  name                       = "${azurerm_management_group.primary_management_groups["platform"].name}-${each.value["name"]}"
  display_name               = "${azurerm_management_group.primary_management_groups["platform"].name}-${each.value["name"]}"
  parent_management_group_id = azurerm_management_group.primary_management_groups["platform"].id
}

resource "azurerm_management_group" "management_management_groups" {
  for_each                   = local.management_management_groups
  name                       = "${azurerm_management_group.platform_management_groups["management"].name}-${each.value["name"]}"
  display_name               = "${azurerm_management_group.platform_management_groups["management"].name}-${each.value["name"]}"
  parent_management_group_id = azurerm_management_group.platform_management_groups["management"].id
}

resource "azurerm_management_group" "connectivity_management_groups" {
  for_each                   = local.connectivity_management_groups
  name                       = "${azurerm_management_group.platform_management_groups["connectivity"].name}-${each.value["name"]}"
  display_name               = "${azurerm_management_group.platform_management_groups["connectivity"].name}-${each.value["name"]}"
  parent_management_group_id = azurerm_management_group.platform_management_groups["connectivity"].id
}

resource "azurerm_management_group" "identity_management_groups" {
  for_each                   = local.identity_management_groups
  name                       = "${azurerm_management_group.platform_management_groups["identity"].name}-${each.value["name"]}"
  display_name               = "${azurerm_management_group.platform_management_groups["identity"].name}-${each.value["name"]}"
  parent_management_group_id = azurerm_management_group.platform_management_groups["identity"].id
}

resource "azurerm_management_group" "app_management_group" {
  name                       = "${azurerm_management_group.primary_management_groups["landing_zones"].name}-${var.landing_zone_app_management_group_name}"
  display_name               = "${azurerm_management_group.primary_management_groups["landing_zones"].name}-${var.landing_zone_app_management_group_name}"
  parent_management_group_id = azurerm_management_group.primary_management_groups["landing_zones"].id
}

resource "azurerm_management_group" "app_child_management_groups" {
  for_each                   = local.app_management_groups
  name                       = "${azurerm_management_group.app_management_group.name}-${each.value["name"]}"
  display_name               = "${azurerm_management_group.app_management_group.name}-${each.value["name"]}"
  parent_management_group_id = azurerm_management_group.app_management_group.id
}

resource "azurerm_subscription" "org_subscriptions" {
  for_each          = local.org_subscriptions
  subscription_name = each.value["name"]
  alias             = each.value["name"]
  billing_scope_id  = data.azurerm_billing_mca_account_scope.mca_account.id
}

resource "azurerm_management_group_subscription_association" "org_associations" {
  for_each            = local.org_subscriptions
  management_group_id = azurerm_management_group.org.id
  subscription_id     = "/subscriptions/${azurerm_subscription.org_subscriptions[(each.key)].subscription_id}"
}
resource "azurerm_subscription" "management_subscriptions" {
  for_each          = local.management_subscriptions
  subscription_name = each.value["name"]
  alias             = each.value["name"]
  billing_scope_id  = data.azurerm_billing_mca_account_scope.mca_account.id
}

resource "azurerm_management_group_subscription_association" "management_associations" {
  for_each            = local.management_subscriptions
  management_group_id = azurerm_management_group.management_management_groups[(each.value["management_group"])].id
  subscription_id     = "/subscriptions/${azurerm_subscription.management_subscriptions[(each.key)].subscription_id}"
}

resource "azurerm_subscription" "connectivity_subscriptions" {
  for_each          = local.connectivity_subscriptions
  subscription_name = each.value["name"]
  alias             = each.value["name"]
  billing_scope_id  = data.azurerm_billing_mca_account_scope.mca_account.id
}

resource "azurerm_management_group_subscription_association" "connectivity_associations" {
  for_each            = local.connectivity_subscriptions
  management_group_id = azurerm_management_group.connectivity_management_groups[(each.value["management_group"])].id
  subscription_id     = "/subscriptions/${azurerm_subscription.connectivity_subscriptions[(each.key)].subscription_id}"
}

resource "azurerm_subscription" "identity_subscriptions" {
  for_each          = local.identity_subscriptions
  subscription_name = each.value["name"]
  alias             = each.value["name"]
  billing_scope_id  = data.azurerm_billing_mca_account_scope.mca_account.id
}

resource "azurerm_management_group_subscription_association" "identity_associations" {
  for_each            = local.identity_subscriptions
  management_group_id = azurerm_management_group.identity_management_groups[(each.value["management_group"])].id
  subscription_id     = "/subscriptions/${azurerm_subscription.identity_subscriptions[(each.key)].subscription_id}"
}

resource "azurerm_subscription" "app_subscriptions" {
  for_each          = local.app_subscriptions
  subscription_name = each.value["name"]
  alias             = each.value["name"]
  billing_scope_id  = data.azurerm_billing_mca_account_scope.mca_account.id
}

resource "azurerm_management_group_subscription_association" "app_associations" {
  for_each            = local.app_subscriptions
  management_group_id = azurerm_management_group.app_child_management_groups[(each.value["management_group"])].id
  subscription_id     = "/subscriptions/${azurerm_subscription.app_subscriptions[(each.key)].subscription_id}"
}
