# Milestone 4: Defining Networking Services with IaC

## Task 1: Create Terraform Project and Modules

In this task, we initialized a new Terraform project and created two modules: `networking-module` and `aks-cluster-module`.

1. Initialize a new Terraform project:

```bash
terraform init
```

2. Create a new directory for your Terraform project:

```bash
mkdir aks-tf-web-app-devops-proj
```

3. Navigate into your new project directory:

```bash
cd aks-tf-web-app-devops-proj
```

4. Create two new directories for your Terraform modules:

```bash
mkdir networking-module
mkdir aks-cluster-module
```

## Task 2: Define the Networking Module Input Variables

We defined the input variables in the `variables.tf` file inside the `networking-module` directory.

1. Create a new file named `variables.tf` in the `networking-module` directory.

2. Open the `variables.tf` file and define the following variables:

```hcl
variable "resource_group_name" {
  description = "The name of the Azure Resource Group where the networking resources will be deployed."
  type        = string
  default     = "default_resource_group_name"
}

variable "location" {
  description = "The Azure region where the networking resources will be deployed."
  type        = string
  default     = "default_location"
}

variable "vnet_address_space" {
  description = "The address space for the Virtual Network (VNet)."
  type        = list(string)
  default     = ["10.0.0.0/16"]
}
```

## Task 3: Define the Networking Resources and NSG Rules

We defined the essential networking resources in the `main.tf` file inside the `networking-module` directory.

1. Create a new file named `main.tf` in the `networking-module` directory.

2. Open the `main.tf` file and define the following resources:

```hcl
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "vnet" {
  name                = "aks-vnet"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  address_space       = var.vnet_address_space
}

resource "azurerm_subnet" "control_plane_subnet" {
  name                 = "control-plane-subnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "worker_node_subnet" {
  name                 = "worker-node-subnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_security_group" "nsg" {
  name                = "aks-nsg"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  security_rule {
    name                       = "kube-apiserver-rule"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "6443"
    source_address_prefix      = "<your-public-ip>"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "ssh-rule"
    priority                   = 1002
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "<your-public-ip>"
    destination_address_prefix = "*"
  }
}
```

## Task 4: Define the Networking Module Output Variables

We defined the output variables in the `outputs.tf` file inside the `networking-module` directory.

1. Create a new file named `outputs.tf` in the `networking-module` directory.

2. Open the `outputs.tf` file and define the following output variables:

```hcl
output "vnet_id" {
  description = "The ID of the Virtual Network (VNet)."
  value       = azurerm_virtual_network.vnet.id
}

output "control_plane_subnet_id" {
  description = "The ID of the control plane subnet within the VNet."
  value       = azurerm_subnet.control_plane_subnet.id
}

output "worker_node_subnet_id" {
  description = "The ID of the worker node subnet within the VNet."
  value       = azurerm_subnet.worker_node_subnet.id
}

output "networking_resource_group_name" {
  description = "The name of the Azure Resource Group where the networking resources were provisioned."
  value       = azurerm_resource_group.rg.name
}

output "aks_nsg_id" {
  description = "The ID of the Network Security Group (NSG)."
  value       = azurerm_network_security_group.nsg.id
}
```

## Task 5: Initialize the Network Module

We initialized the networking module to ensure it is ready to use within the main project.

1. Navigate to the `networking-module` directory.

2. Run the following command to initialize the module:

```bash
terraform init
```