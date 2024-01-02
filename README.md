# Azure End-to-End DevOps Pipeline Project

This project involves building a comprehensive end-to-end DevOps pipeline to support an internal web application designed to manage and monitor deliveries across the company. The project is divided into ten milestones, each with several tasks.

## Table of Contents
1. [Project Overview](#project-overview)
2. [Milestone 1: Set up the Environment](#milestone-1-set-up-the-environment)
3. [Milestone 2: Version Control](#milestone-2-version-control)
4. [Milestone 3: Containerization with Docker](#milestone-3-containerization-with-docker)
5. [Milestone 4: Defining Networking Services with IaC](#milestone-4-defining-networking-services-with-iac)
6. [Milestone 5: Defining an AKS Cluster with IaC](#milestone-5-defining-an-aks-cluster-with-iac)
7. [Upcoming Milestones](#upcoming-milestones)

## Project Overview
The project involves implementing version control to allow the team to work collaboratively and integrate new features into the web application. It also includes packing the application and its dependencies using Docker to ensure the application's consistency and portability. The project leverages infrastructure as code (IaC) to define and manage resources within Azure and uses Kubernetes to orchestrate the deployment of the containerized application. Lastly, it employs CI/CD practices to automate the build and deployment of the application.

## Milestone 1: Set up the Environment
The first milestone involved setting up GitHub. A personal copy of the [Web-App-DevOps-Project](https://github.com/maya-a-iuga/Web-App-DevOps-Project) GitHub repository was created by forking the repository. This copy is a separate repository hosted on the GitHub account, allowing for changes to the forked repository, creation of branches, committing code, and managing it like any other repository.

## Milestone 2: Version Control
The second milestone involved diving into the world of version control and working on delivering new features. The tasks completed in this milestone include:

1. **Clone The Forked Repository**: The forked repository was cloned onto the local machine.
2. **Create Issue for New Column**: An issue was created on the forked GitHub repository to track the development of the `delivery_date` column feature.
3. **Create Feature Branch**: A new branch called `feature/add-delivery-date` was created. This branch isolated the code changes required to include the `delivery_date` column.
4. **Make Code Changes**: The code was modified to incorporate the `delivery_date` column. Both the `app.py` and `order.html` files in the repository were updated.
5. **Push Changes to the Remote Branch**: After making the necessary code changes, the changes were pushed to the remote repository.
6. **Create Pull Request**: A pull request was submitted to merge the code changes from the feature branch into the main branch.
7. **Merge Pull Request**: The changes were reviewed and the pull request was merged.
8. **Revert Changes**: A new branch called `revert-delivery-date` was created. Used `git revert COMMIT_HASH` command to revert back to before the `delivery_date` column was implemented.

A more detail documentation of implementing the new feature `delivery_date` column is contained within [Documentation - Implementing the ‘delivery_date’ Column.md](https://github.com/a-maruf/Web-App-DevOps-Project/blob/main/Documentation%20-%20Implementing%20the%20%E2%80%98delivery_date%E2%80%99%20Column.md) file.

## Milestone 3: Containerization with Docker

The third milestone involved containerizing the application using Docker and making it available on Docker Hub. The tasks completed in this milestone include:

1. **Containerize the Web Application**: The application was containerized using Docker. A Dockerfile was created to define the application's environment, encapsulate all necessary dependencies, and configuration settings.

2. **Build Docker Image**: The Docker image was built using the `docker build` command. The `-t` option was used to tag the image with a name for easy reference.

3. **Run Docker Container Locally**: The Docker container was run locally using the `docker run` command. The `-p` option was used to map port 5000 from the local machine to the container.

4. **Tag and Push to Docker Hub**: The Docker image was tagged and pushed to Docker Hub using the `docker tag` and `docker push` commands.

5. **Verify Image on Docker Hub**: The Docker image was verified on Docker Hub by logging into Docker Hub and confirming that the image was listed within the repository.

Detailed documentation of the process, including the Dockerfile and the Docker commands used, can be found in the [Documentation - Containerization with Docker.md](https://github.com/a-maruf/Web-App-DevOps-Project/blob/main/Documentation%20-%20Containerization%20with%20Docker.md) file in the root directory of the project.

## Milestone 4: Defining Networking Services with IaC

This fourth milestone focused on defining the networking services using Infrastructure as Code (IaC) with Terraform. We created a Terraform project and defined two modules: `networking-module` and `aks-cluster-module`.

1. **Create Terraform Project and Modules:** Initialized a new Terraform project and created two directories for the Terraform modules.

2. **Define the Networking Module Input Variables:** Defined the input variables in the `variables.tf` file inside the `networking-module` directory. These variables include `resource_group_name`, `location`, and `vnet_address_space`.

3. **Define the Networking Resources and NSG Rules:** Defined the essential networking resources in the `main.tf` file inside the `networking-module` directory. These resources include an Azure Resource Group, a Virtual Network (VNet), two subnets (for the control plane and worker nodes), and a Network Security Group (NSG) with two inbound rules.

4. **Define the Networking Module Output Variables:** Defined the output variables in the `outputs.tf` file inside the `networking-module` directory. These variables include `vnet_id`, `control_plane_subnet_id`, `worker_node_subnet_id`, `networking_resource_group_name`, and `aks_nsg_id`.

5. **Initialize the Network Module:** Initialized the networking module to ensure it is ready to use within the main project.

This milestone defined the necessary networking services using IaC, which is a crucial step in setting up a comprehensive end-to-end DevOps pipeline. Detailed documentation of the process can be found in the [Documentation - Defining Networking Services with IaC.md](https://github.com/a-maruf/Web-App-DevOps-Project/blob/main/Documentation%20-%20Defining%20Networking%20Services%20with%20IaC.md) file in the root directory of the project.

## Milestone 5: Defining an AKS Cluster with IaC

This fifth milestone focuses creating the AKS cluster module, bringing you one step closer to launching a Kubernetes cluster using Terraform.


1. **Define the Cluster Module Input Variables** Defined the input variables in the `variables.tf` file inside the `aks-cluster-module` directory.

2. **Define the Cluster Resources** Defined the necessary Azure resources for provisioning an AKS cluster in the `main.tf` file inside the `aks-cluster-module` directory.

3. **Define the Cluster Module Output Variables** Defined the output variables in the `outputs.tf` file inside the `aks-cluster-module` directory.

4. **Initialize the Cluster Module** Initialized the `aks-cluster-module` to ensure it is ready to use within the main project.

Detailed documentation of the process can be found in the [Documentation - Defining an AKS Cluster with IaC.md](https://github.com/a-maruf/Web-App-DevOps-Project/blob/main/Documentation%20-%20Defining%20an%20AKS%20Cluster%20with%20IaC.md) file in the root directory of the project.

## Upcoming Milestones
The upcoming milestones in the project include:

- Milestone 5: Defining an AKS Cluster with IaC
- Milestone 6: Create an AKS Cluster with IaC
- Milestone 7: Kubernetes Deployment to AKS
- Milestone 8: CI/CD Pipeline with Azure DevOps
- Milestone 9: AKS Cluster Monitoring
- Milestone 10: AKS Integration with Azure Key Vault for Secrets Management

These milestones will be updated as they are completed.
