
# Terraform Commands

Here are some useful Terraform commands for managing our infrastructure:

- **Initialize Terraform configuration**:
  ```sh
  terraform init
This command initializes a working directory containing Terraform configuration files. It downloads and installs the required providers and modules.

Format Terraform configuration files:

```sh
terraform fmt

This command formats the Terraform configuration files to a canonical format and style.

Validate Terraform configuration:

sh
Copy code
terraform validate
This command validates the configuration files in a directory, ensuring that they are syntactically valid and internally consistent.

Generate and show an execution plan:

sh
Copy code
terraform plan
This command creates an execution plan, which shows what actions Terraform will take to change the infrastructure to match the configuration.

Apply the changes required to reach the desired state of the configuration:

sh
Copy code
terraform apply -auto-approve
This command applies the changes required to reach the desired state of the configuration. The -auto-approve flag skips interactive approval of the plan before applying.

Destroy the Terraform-managed infrastructure:

sh
Copy code
terraform destroy -auto-approve
This command destroys all the resources managed by Terraform. The -auto-approve flag skips interactive approval before destruction.

Show the current state or a saved plan:

sh
Copy code
terraform show
This command shows the current state or a saved plan, allowing you to inspect the details of Terraform's plan or state.

Update the state file with real infrastructure:

sh
Copy code
terraform refresh
This command updates the state file with the actual state of the resources, refreshing the data in the state file to reflect the real infrastructure.
