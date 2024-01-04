# Milestone 6: Creating an AKS Cluster with IaC

## Task 1: Define the Project Main Configuration

In this task, we defined the Azure provider and integrated the `networking-module` in the `main.tf` file in the main project directory (`aks-terraform-web-app-devops-proj`).

```hcl
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

provider "azurerm" {
  features {}
  client_id       = var.client_id
  client_secret   = var.client_secret
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  skip_provider_registration = "true"
}

module "networking" {
  source = "./networking-module"
  
  resource_group_name = "networking-resource-group"
  location            = "UK South"
  vnet_address_space  = ["10.0.0.0/16"]
}
```

## Task 2: Integrate the Networking Module

We integrated the `networking-module` in the `main.tf` file in the main project directory (`aks-terraform-web-app-devops-proj`).

```hcl
module "networking" {
  source = "./networking-module"
  
  resource_group_name = "networking-resource-group"
  location            = "UK South"
  vnet_address_space  = ["10.0.0.0/16"]
}
```

## Task 3: Integrate the Cluster Module

We integrated the `aks-cluster-module` in the `main.tf` file in the main project directory (`aks-terraform-web-app-devops-proj`).

```hcl
module "aks_cluster" {
  source = "./aks-cluster-module"

  aks_cluster_name           = "terraform-aks-cluster"
  cluster_location           = "UK South"
  dns_prefix                 = "myaks-project"
  kubernetes_version         = "1.26.6"
  service_principal_client_id = var.client_id
  service_principal_client_secret    = var.client_secret
  resource_group_name         = module.networking.networking_resource_group_name
  vnet_id                     = module.networking.vnet_id
  control_plane_subnet_id     = module.networking.control_plane_subnet_id
  worker_node_subnet_id       = module.networking.worker_node_subnet_id
}
```

## Task 4: Apply the Main Project Configuration

We initialized and applied the project configuration to provision the AKS cluster.

```bash
terraform init
terraform validate
terraform plan
terraform apply
```

## Task 5: Access the AKS Cluster

We accessed the AKS cluster using the `kubectl` command-line tool.

```bash
az aks get-credentials --resource-group networking-resource-group --name terraform-aks-cluster
kubectl cluster-info
```