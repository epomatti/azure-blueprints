resource "azuread_group" "blueprint" {
  display_name     = "BlueprintGroup"
  security_enabled = true
}
