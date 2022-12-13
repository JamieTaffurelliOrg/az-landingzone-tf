# az-landingzone-tf
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.3.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.20 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 3.20 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_management_group.app_child_management_groups](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/management_group) | resource |
| [azurerm_management_group.app_management_group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/management_group) | resource |
| [azurerm_management_group.connectivity_management_groups](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/management_group) | resource |
| [azurerm_management_group.identity_management_groups](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/management_group) | resource |
| [azurerm_management_group.management_management_groups](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/management_group) | resource |
| [azurerm_management_group.org](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/management_group) | resource |
| [azurerm_management_group.platform_management_groups](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/management_group) | resource |
| [azurerm_management_group.primary_management_groups](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/management_group) | resource |
| [azurerm_management_group_policy_assignment.org](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/management_group_policy_assignment) | resource |
| [azurerm_management_group_subscription_association.app_associations](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/management_group_subscription_association) | resource |
| [azurerm_management_group_subscription_association.connectivity_associations](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/management_group_subscription_association) | resource |
| [azurerm_management_group_subscription_association.identity_associations](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/management_group_subscription_association) | resource |
| [azurerm_management_group_subscription_association.management_associations](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/management_group_subscription_association) | resource |
| [azurerm_management_group_subscription_association.org_associations](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/management_group_subscription_association) | resource |
| [azurerm_subscription.app_subscriptions](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subscription) | resource |
| [azurerm_subscription.connectivity_subscriptions](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subscription) | resource |
| [azurerm_subscription.identity_subscriptions](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subscription) | resource |
| [azurerm_subscription.management_subscriptions](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subscription) | resource |
| [azurerm_subscription.org_subscriptions](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subscription) | resource |
| [azurerm_billing_mca_account_scope.mca_account](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/billing_mca_account_scope) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_billing_account_name"></a> [billing\_account\_name](#input\_billing\_account\_name) | The name of the billing account to attach to subscriptions | `string` | n/a | yes |
| <a name="input_billing_profile_name"></a> [billing\_profile\_name](#input\_billing\_profile\_name) | The name of the billing profile to attach to subscriptions | `string` | n/a | yes |
| <a name="input_invoice_section_name"></a> [invoice\_section\_name](#input\_invoice\_section\_name) | The name of the invoice section to attach to subscriptions | `string` | n/a | yes |
| <a name="input_landing_zone_app_management_group_name"></a> [landing\_zone\_app\_management\_group\_name](#input\_landing\_zone\_app\_management\_group\_name) | The name of the landing zone management group of your app/product | `string` | n/a | yes |
| <a name="input_management_group_name_prefix"></a> [management\_group\_name\_prefix](#input\_management\_group\_name\_prefix) | The prefix to give to the management groups created, e.g, 'mg-jt' | `string` | n/a | yes |
| <a name="input_org_management_group_name"></a> [org\_management\_group\_name](#input\_org\_management\_group\_name) | The name of the organsation management group | `string` | n/a | yes |
| <a name="input_policy_managed_identity_location"></a> [policy\_managed\_identity\_location](#input\_policy\_managed\_identity\_location) | The location of the managed identity to attach to policies | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_app_child_management_group_ids"></a> [app\_child\_management\_group\_ids](#output\_app\_child\_management\_group\_ids) | Resource IDs of the child app management groups |
| <a name="output_app_management_group_id"></a> [app\_management\_group\_id](#output\_app\_management\_group\_id) | Resource IDs of the app management groups |
| <a name="output_app_subscriptions"></a> [app\_subscriptions](#output\_app\_subscriptions) | Properties of the app subscriptions |
| <a name="output_connectivity_management_group_ids"></a> [connectivity\_management\_group\_ids](#output\_connectivity\_management\_group\_ids) | Resource IDs of the connectivity management groups |
| <a name="output_connectivity_subscriptions"></a> [connectivity\_subscriptions](#output\_connectivity\_subscriptions) | Properties of the connectivity subscriptions |
| <a name="output_identity_management_group_ids"></a> [identity\_management\_group\_ids](#output\_identity\_management\_group\_ids) | Resource IDs of the identity management groups |
| <a name="output_identity_subscriptions"></a> [identity\_subscriptions](#output\_identity\_subscriptions) | Properties of the identity subscriptions |
| <a name="output_management_management_group_ids"></a> [management\_management\_group\_ids](#output\_management\_management\_group\_ids) | Resource IDs of the management management groups |
| <a name="output_management_subscriptions"></a> [management\_subscriptions](#output\_management\_subscriptions) | Properties of the management subscriptions |
| <a name="output_org_management_group_id"></a> [org\_management\_group\_id](#output\_org\_management\_group\_id) | Resource ID of the organisation management group |
| <a name="output_org_subscriptions"></a> [org\_subscriptions](#output\_org\_subscriptions) | Properties of the organisation level subscriptions |
| <a name="output_platform_management_group_ids"></a> [platform\_management\_group\_ids](#output\_platform\_management\_group\_ids) | Resource IDs of the platform management groups |
| <a name="output_primary_management_group_ids"></a> [primary\_management\_group\_ids](#output\_primary\_management\_group\_ids) | Resource IDs of the primary management groups |
<!-- END_TF_DOCS -->
