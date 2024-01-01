# Azure Blueprint

Sample recipe for an Azure Blueprint.

First, create the base Entra ID Group and Azure Policy resources:

```sh
terraform init
terraform apply -auto-approve
```

Using the Portal, create the Blueprint definition.

For version `1.0.0`:

| Artifact | Details |
|----------|----------|
| Resource group    | Set the location to `brazilsouth` |
| ARM template (VNET)   | Use the template in [./arm/vnet](./arm/vnet) |
| Policy assignment    | Select the `BlueprintLocationPolicyAssignment` policy assignment |
| Role assignment    | Select the `Contributor` role |

