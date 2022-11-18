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
## Terraform stages
- Write -> You define resources, which may be across multiple cloud providers and services.
- Plan -> Terraform creates an execution plan describing the infrastructe it will create, update, or destroy based on the existing infrastructure and your configuration. `terraform plan`
- Apply -> On approval, Terraform performs the proposed operations in the correct order, respecting any resource dependencies. `terraform apply`
![terraform](https://user-images.githubusercontent.com/115226294/202477572-d7d8d1b6-d73d-43c0-a097-a2ffc6f7d13f.png)
#### Other useful terraform commands
- `terraform init` - Prepare your working directory for other commands
- `terraform validate` - Check whether the configuration is valid
- `terraform destroy` - Destroy previously-created infrastructure on Cloud

## How to install Terraform
1. Open powershell in admin mode and install chocolatey.
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
![terra diagram](https://user-images.githubusercontent.com/115226294/202477849-833606fd-f8e3-4357-9adb-f7163c7da741.png)

- So first we install terraform on our local machine using steps above
- After installing we need to create some environment variables so terraform can read our work
    - here we give terraform access to our AWS console by providing our access and secret keys
- Once set up we create a file called `main.tf` - here is where we add our scripts
- We need to initialise this code file to run our instructions
    - to do this we use terraform commands:
    - terraform plan - plans our code
    - terraform apply v - runs the code and checks syntax, when all correct it launches the machine
    - terraform destroy - destroys the machine
- These instructions go to any cloud provider - AWS, Azure, GCP
- Inside our scripts we need to specifiacally describe exactly how we want our instance to be set up
    - regions
    - type of instance 
    - security keys
    - VPC
    - security groups
    - Route tables
    - Internet gateways
    - Subnets etc
```
chmod 400 eng130-new.pub

terraform plan
terraform apply
 go to ssh folder
 ssh in

provider 
specify aws and region

create vpc
add tag

create ig
attach to vpc using resource name - ids are in tfstate file
add tag

subnet
specify vpc id
add cidr block - subnet one
add the availability zone - 1a
map public ip on launch - gives it a name
add tag

sg
ingress
http
ssh

egress 
everyone
tags

rt
vpc id
route
  cidr block
  ig

rt association
subnet id
route table

create instance
ami
type
subnet id
sg id
public ip true
key name
add tag

```
![untitledterr](https://user-images.githubusercontent.com/115226294/202727243-df40a638-89ff-44d1-983f-99ed170d9a12.png)

### Steps
1. From your local host using terraform create main.tf file to launch the EC2 instances(3 instances) in AWS.
  - Create another file variable.tf for storing varibles
- Install ansible in one of the EC2 instance which acts as ansible controller
From the controller install the node app in web EC2 instance using node.yml file
From the controller install the mongodb in mongodb EC2 instance using mongo.yml file

#### IAC for configuration management and orchestration
##### terraraform first provisions the infrastructure then ansible installs and updates software
provisioning in main.tf - configures the infrastructure
terraform deploys to cloud providers
launch vpc in terraform first

go to ansible controller
tell controller to find your ec2 from terra and run your pplaybooks - install nginx, node, mongo etc
create a playbook to link all playbooks together

why do we use playbooks
- provision multiple instances - change hosts to all
- provision.sh only provisions 1 at a time