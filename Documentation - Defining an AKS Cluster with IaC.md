# Milestone 5: Defining an AKS Cluster with IaC

## Task 1: Define the Cluster Module Input Variables

In this task, we defined the input variables in the `variables.tf` file inside the `aks-cluster-module` directory.

```hcl
variable "aks_cluster_name" {
  description = "The name of the AKS cluster you wish to create."
  type        = string
}

variable "cluster_location" {
  description = "The Azure region where the AKS cluster will be deployed."
  type        = string
}

variable "dns_prefix" {
  description = "The DNS prefix of the cluster."
  type        = string
}

variable "kubernetes_version" {
  description = "The Kubernetes version the cluster will use."
  type        = string
}

variable "service_principal_client_id" {
  description = "The Client ID for the service principal associated with the cluster."
  type        = string
}

variable "service_principal_secret" {
  description = "The Client Secret for the service principal."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the Azure Resource Group where the networking resources were provisioned."
  type        = string
}

variable "vnet_id" {
  description = "The ID of the Virtual Network (VNet)."
  type        = string
}

variable "control_plane_subnet_id" {
  description = "The ID of the control plane subnet within the VNet."
  type        = string
}

variable "worker_node_subnet_id" {
  description = "The ID of the worker node subnet within the VNet."
  type        = string
}
```

## Task 2: Define the Cluster Resources

We defined the necessary Azure resources for provisioning an AKS cluster in the `main.tf` file inside the `aks-cluster-module` directory.

```hcl
resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = var.aks_cluster_name
  location            = var.cluster_location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix
  kubernetes_version  = var.kubernetes_version

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_DS2_v2"
    enable_auto_scaling = true
    min_count = 1
    max_count = 3
  }

  service_principal {
    client_id     = var.service_principal_client_id
    client_secret = var.service_principal_secret
  }
}
```

## Task 3: Define the Cluster Module Output Variables

We defined the output variables in the `outputs.tf` file inside the `aks-cluster-module` directory.

```hcl
output "aks_cluster_name" {
  description = "The name of the provisioned AKS cluster."
  value       = azurerm_kubernetes_cluster.aks_cluster.name
}

output "aks_cluster_id" {
  description = "The ID of the provisioned AKS cluster."
  value       = azurerm_kubernetes_cluster.aks_cluster.id
}

output "aks_kubeconfig" {
  description = "The Kubernetes configuration file of the cluster."
  value       = azurerm_kubernetes_cluster.aks_cluster.kube_config_raw
  sensitive   = true
}
```

## Task 4: Initialize the Cluster Module

We initialized the `aks-cluster-module` to ensure it is ready to use within the main project.

```bash
cd aks-cluster-module
terraform init
```