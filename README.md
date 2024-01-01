# Azure Blueprint

Sample recipe for an Azure Blueprint.

First, create the base Entra ID Group and Azure Policy resources:

```sh
terraform init
terraform apply -auto-approve
```

Using the Portal, create the Blueprint definition.

| Artifact | Details |
|----------|----------|
| Resource group    | No need to inform any values |
| ARM template (VNET)   | Use the template in [./arm/vnet](./arm/vnet). |
| Policy assignment    | Select the `BlueprintLocationPolicyAssignment` policy assignment. |
| Role assignment    | Select the `Contributor` role. |

Optionally, select the subscription.

Save the draft, and publish with version `1.0`.

For the assignment, set all of the parameters and 'Assign'. Choosing `System assigned` is fine for a demo.

> By clicking "Assign" with a system assigned identity, you agree to grant the Azure Blueprints service temporary Owner access to this subscription so that we can properly deploy all Artifacts. We will automatically remove this access when the blueprint assignment process is finished.

Wait for the provisioning to be complete.

Now update the definition, adding the [./arm/nsg](./arm/nsg) ARM template, and save a new draft.

Publish a new version `1.1`.

Update the assignment to version `1.1`.
