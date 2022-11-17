What is Terraform, benefits - use cases - who is using it - who owns it

## What is Terraform
- Terraform is an open-source infrastructure as code software tool.
- It is a tool for building, changing and versioning infrastructure safely and efficiently.
- Terraform enables developers to use a high-level configuration language called HCL (HashiCorp Configuration Language) to describe the desired “end-state”
- Terraform files are created with a .tf extention
- Terraform allows for rapid create of instances using AMIs
- HashiCorp Terraform is the most popular and open-source tool for infrastructure automation. It helps in configuring, provisioning, and managing the infrastructure as code.

## Benefits
There are a few key reasons developers choose to use Terraform over other Infrastructure as Code tools:
1. Open source: Terraform is backed by large communities of contributors who build plugins to the platform.
2. Platform agnostic: Meaning you can use it with any cloud services provider. Most other IaC tools are designed to work with single cloud provider. This allows a single configuration to be used to manage multiple providers, and to even handle cross-cloud dependencies.
    - Can be used to build large scale multi-cloud infrastructures
3. Immutable infrastructure: Terraform provisions immutable infrastructure, which means that with each change to the environment, the current configuration is replaced with a new one that accounts for the change, and the infrastructure is reprovisioned. Even better, previous configurations can be retained as versions to enable rollbacks if necessary or desired.

## Use cases
1. Multi-Cloud Deployment- can provision infrastructure across multiple clouds increases fault-tolerance, allowing for more graceful recovery from cloud provider outages. However, multi-cloud deployments add complexity because each provider has its own interfaces, tools, and workflows.
2. Automate consistent workflows and create a pipeline for provisioning Infrastructure as Code. 

## Who uses it
- Used by DevOps engineers - to automate infrastructure tasks
- Uber, Udemy

## Who owns it
- Hashicorp
## Terraform state
- Terraform stores information about your infrastructure in a state file. This state file keeps track of resources created by your configuration and maps them to real-world resources.

- Write -> You define resources, which may be across multiple cloud providers and services.
- Plan -> Terraform creates an execution plan describing the infrastructe it will create, update, or destroy based on the existing infrastructure and your configuration.
- Apply -> On approval, Terraform performs the proposed operations in the correct order, respecting any resource dependencies.

## How to install Terraform
2. Open powershell in admin mode and install chocolatey.
- `Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))`
2. Once that installation is complete, check chocolatey is install by running `choco` and if everything works you should see choco version `choco --version`
3. Once that is done, run `choco install terraform` and if everything is installed correctly, you should be able to see terraform version `terraform --version`.

### Cheat sheet

```
$ terraform
Usage: terraform [global options] <subcommand> [args]

The available commands for execution are listed below.
The primary workflow commands are given first, followed by
less common or more advanced commands.

Main commands:
  init          Prepare your working directory for other commands
  validate      Check whether the configuration is valid
  plan          Show changes required by the current configuration
  apply         Create or update infrastructure
  destroy       Destroy previously-created infrastructure

All other commands:
  console       Try Terraform expressions at an interactive command prompt
  fmt           Reformat your configuration in the standard style
  force-unlock  Release a stuck lock on the current workspace
  get           Install or upgrade remote Terraform modules
  graph         Generate a Graphviz graph of the steps in an operation
  import        Associate existing infrastructure with a Terraform resource
  login         Obtain and save credentials for a remote host
  logout        Remove locally-stored credentials for a remote host
  output        Show output values from your root module
  providers     Show the providers required for this configuration
  refresh       Update the state to match remote systems
  show          Show the current state or a saved plan
  state         Advanced state management
  taint         Mark a resource instance as not fully functional
  test          Experimental support for module integration testing
  untaint       Remove the 'tainted' state from a resource instance
  version       Show the current Terraform version
  workspace     Workspace management

Global options (use these before the subcommand, if any):
  -chdir=DIR    Switch to a different working directory before executing the
                given subcommand.
  -help         Show this help output, or the help for a specified subcommand.
  -version      An alias for the "version" subcommand.
  ```

```
install terraform on local host
install env var
files end in .tf
add code in main.tf

terraform init - initialise terraform and download dependencies required

terraform plan - write configurations
terraform apply - run it
terraform destroy - destroys

these files go :
hybrid cloud iac with terraform - aws, azure, gcp
- where in aws do you want to launch etc..
- need access and secret keys
    - create a env var called AWS_ACCESS_KEY and secret key
    - create env var in localhost

create a variable.tf to store variables and call to main.tf

```