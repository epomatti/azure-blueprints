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

