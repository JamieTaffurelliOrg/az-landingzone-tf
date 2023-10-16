locals {
  primary_management_groups = {
    platform = {
      name = "platform"
    }
    landing_zones = {
      name = "landingzones"
    }
    decomissioned = {
      name = "decommissioned"
    }
    sandbox = {
      name = "sandbox"
    }
  }
  platform_management_groups = {
    management = {
      name = "management"
    }
    connectivity = {
      name = "connectivity"
    }

    identity = {
      name = "identity"
    }
  }
  management_management_groups = {
    dev = {
      name = "dev"
    }
    prod = {
      name = "prod"
    }
    shared = {
      name = "shared"
    }
  }
  connectivity_management_groups = {
    dev = {
      name = "dev"
    }
    prod = {
      name = "prod"
    }
    shared = {
      name = "shared"
    }
  }

  identity_management_groups = {
    shared = {
      name = "shared"
    }
  }

  child_landing_zones = distinct(flatten([
    for landing_zone in var.landing_zones : [
      for child_landing_zone in landing_zone.management_groups : {
        name   = child_landing_zone.name
        parent = landing_zone.name
      }
  ]]))

  org_subscriptions = {
    setup_prod = {
      name = "setup-prod"
    }
    terraform_external_prod = {
      name = "terraform-external-prod"
    }
  }

  management_subscriptions = {
    management_dev = {
      name             = "management-dev"
      management_group = "dev"
    }
    management_prod = {
      name             = "management-prod"
      management_group = "prod"
    }
    management_shared = {
      name             = "management-shared"
      management_group = "shared"
    }
  }

  connectivity_subscriptions = {
    connectivity_dev = {
      name             = "connectivity-dev"
      management_group = "dev"
    }
    connectivity_prod = {
      name             = "connectivity-prod"
      management_group = "prod"
    }
    connectivity_shared = {
      name             = "connectivity-shared"
      management_group = "shared"
    }
  }

  identity_subscriptions = {
    identity_shared = {
      name             = "identity-shared"
      management_group = "shared"
    }
  }

  landing_zone_subscriptions = distinct(flatten([
    for landing_zone in var.landing_zones : [
      for subscription in landing_zone.subscriptions : {
        name   = subscription
        parent = landing_zone.name
      }
  ]]))

  child_landing_zone_subscriptions = distinct(flatten([
    for landing_zone in var.landing_zones : [
      for child_landing_zone in landing_zone.management_groups : [
        for subscription in child_landing_zone.subscriptions : {
          name   = subscription
          parent = child_landing_zone.name
        }
      ]
  ]]))

  org_policies = [
    {
      name         = "audit-password"
      display_name = "Audit machines with insecure password security settings"
      id           = "/providers/Microsoft.Authorization/policySetDefinitions/095e4ed9-c835-4ab6-9439-b5644362a06c"
      identity = {
        type = "SystemAssigned"
      }
    },
    {
      name         = "NIST SP 800-53 Rev. 5"
      display_name = "NIST SP 800-53 Rev. 5"
      id           = "/providers/Microsoft.Authorization/policySetDefinitions/179d1daa-458f-4e47-8086-2a68d0d6c38f"
      identity = {
        type = "SystemAssigned"
      }
    },
    {
      name         = "Azure Security Benchmark"
      display_name = "Azure Security Benchmark"
      id           = "/providers/Microsoft.Authorization/policySetDefinitions/1f3afdf9-d0c9-4c3d-847f-89da613e70a8"
      identity = {
        type = "SystemAssigned"
      }
    },
    {
      name         = "k8s-lin-sec-restricted"
      display_name = "Kubernetes cluster pod security restricted standards for Linux-based workloads"
      id           = "/providers/Microsoft.Authorization/policySetDefinitions/42b8ef37-b724-4e24-bbc8-7a7708edfe00"
      identity = {
        type = "SystemAssigned"
      }
    },
    {
      name         = "PCI v3.2.1 2018"
      display_name = "PCI v3.2.1:2018"
      id           = "/providers/Microsoft.Authorization/policySetDefinitions/496eeda9-8f2f-4d5e-8dfd-204f0a92ed41"
      identity = {
        type = "SystemAssigned"
      }
    },
    {
      name         = "cis-az-1.4"
      display_name = "CIS Microsoft Azure Foundations Benchmark v1.4.0"
      id           = "/providers/Microsoft.Authorization/policySetDefinitions/c3f5c4d9-9a1d-4a99-85c0-7f93e384d5c5"
      identity = {
        type = "SystemAssigned"
      }
    },
    {
      name         = "nsg-flow-logs"
      display_name = "Flow logs should be configured and enabled for every network security group"
      id           = "/providers/Microsoft.Authorization/policySetDefinitions/62329546-775b-4a3d-a4cb-eb4bb990d2c0"
      identity = {
        type = "SystemAssigned"
      }
    },
    {
      name         = "eval-private-link"
      display_name = "Evaluate Private Link Usage Across All Supported Azure Resources"
      id           = "/providers/Microsoft.Authorization/policySetDefinitions/7379ef4c-89b0-48b6-a5cc-fd3a75eaef93"
      identity = {
        type = "SystemAssigned"
      }
    },
    {
      name         = "ISO 27001 2013"
      display_name = "ISO 27001:2013"
      id           = "/providers/Microsoft.Authorization/policySetDefinitions/89c6cddc-1c73-4ac1-b19c-54d1a15a42f2"
      identity = {
        type = "SystemAssigned"
      }
    },
    {
      name         = "k8s-lin-sec-baseline"
      display_name = "Kubernetes cluster pod security baseline standards for Linux-based workloads"
      id           = "/providers/Microsoft.Authorization/policySetDefinitions/a8640138-9b0a-4a28-b8cb-1666c838647d"
      identity = {
        type = "SystemAssigned"
      }
    },
    {
      name         = "PCI DSS v4"
      display_name = "PCI DSS v4"
      id           = "/providers/Microsoft.Authorization/policySetDefinitions/c676748e-3af9-4e22-bc28-50feed564afb"
      identity = {
        type = "SystemAssigned"
      }
    }
  ]
}
