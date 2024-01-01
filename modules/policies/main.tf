resource "azurerm_policy_definition" "policy" {
  name         = "BlueprintLocationPolicy"
  policy_type  = "Custom"
  mode         = "Indexed"
  display_name = "Controls the locations where resources can be deployed."


  metadata = jsonencode({
    category = "General"
  })


  policy_rule = jsonencode({
    if : {
      not : {
        field : "location",
        in : "[parameters('allowedLocations')]"
      }
    },
    then : {
      effect : "deny"
    }
  })

  parameters = jsonencode({
    allowedLocations = {
      type = "Array"
      metadata = {
        description = "The list of allowed locations for resources."
        displayName = "Allowed locations"
        strongType  = "location"
      }
    }
  })
}

data "azurerm_subscription" "current" {
}

resource "azurerm_subscription_policy_assignment" "policy" {
  name                 = "BlueprintLocationPolicyAssignment"
  subscription_id      = data.azurerm_subscription.current.id
  policy_definition_id = azurerm_policy_definition.policy.id
  description          = "Assignment of BlueprintLocationPolicy"
  display_name         = "BlueprintLocationPolicyAssignment"

  parameters = jsonencode({
    allowedLocations = {
      value = ["${var.location}"]
    }
  })
}
