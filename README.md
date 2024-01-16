# Azure End-to-End DevOps Pipeline Project

This project involves building a comprehensive end-to-end DevOps pipeline to support an internal web application designed to manage and monitor deliveries across the company. The project is divided into ten milestones, each with several tasks.

## Table of Contents
1. [Project Overview](#project-overview)
2. [Milestone 1: Set up the Environment](#milestone-1-set-up-the-environment)
3. [Milestone 2: Version Control](#milestone-2-version-control)
4. [Milestone 3: Containerization with Docker](#milestone-3-containerization-with-docker)
5. [Milestone 4: Defining Networking Services with IaC](#milestone-4-defining-networking-services-with-iac)
6. [Milestone 5: Defining an AKS Cluster with IaC](#milestone-5-defining-an-aks-cluster-with-iac)
7. [Milestone 6: Creating an AKS Cluster with IaC](#milestone-6-creating-an-aks-cluster-with-iac)
8. [Milestone 7: Kubernetes Deployment to AKS](#milestone-7-kubernetes-deployment-to-aks)
9. [Milestone 8: CI/CD Pipeline with Azure DevOps](#milestone-8-cicd-pipeline-with-azure-devops)
10.	[Milestone 9: AKS Cluster Monitoring](#milestone-9-aks-cluster-monitoring)
11. [Milestone 10: AKS Integration with Azure Key Vault for Secrets Management](#milestone-10-aks-integration-with-azure-key-vault-for-secrets-management)

## Project Overview
The project involves implementing version control to allow the team to work collaboratively and integrate new features into the web application. It also includes packing the application and its dependencies using Docker to ensure the application's consistency and portability. The project leverages infrastructure as code (IaC) to define and manage resources within Azure and uses Kubernetes to orchestrate the deployment of the containerized application. Lastly, it employs CI/CD practices to automate the build and deployment of the application.

![DevOps Pipeline Architecture.png](https://github.com/a-maruf/Web-App-DevOps-Project/blob/main/Images/DevOps%20Pipeline%20Architecture.png)

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

## Milestone 6: Creating an AKS Cluster with IaC

1. **Define the Project Main Configuration** Defined the Azure provider block to enable authentication to Azure using service principal credentials and integrated the `networking-module` in the `main.tf` file in the main project directory.

2. **Integrate the Networking Module** Integrated the `networking-module` in the `main.tf` file in the main project directory. This integration will ensure that the networking resources previously defined in their respective module are included, and therefore accessible in the main project.

3. **Integrate the Cluster Module** Integrated the `aks-cluster-module` in the `main.tf` file in the main project directory. 
	Integrate the cluster module in the main project configuration file. This step connects the AKS cluster specifications to the main project, as well as allowing you to provision the cluster within the previously defined networking infrastructure. 

4. **Apply the Main Project Configuration** Within the main project directory initialize the Terraform project. Once the project is initialized, apply the Terraform configuration. This will initiate the creation of the defined infrastructure, including the networking resources and AKS cluster.

5. **Access the AKS Cluster** Retrieve the kubeconfig file once the AKS cluster has been provisioned using `az aks get-credentials --resource-group <your-resource-group> --name <your-aks-cluster-name>`. This configuration file allows you to connect to the AKS cluster securely. Connect to the newly created cluster to ensure that the provisioning process was successful and the cluster is operational.

Detailed documentation of the process can be found in the [Documentation - Creating an AKS Cluster with IaC.md](https://github.com/a-maruf/Web-App-DevOps-Project/blob/main/Documentation%20-%20Creating%20an%20AKS%20Cluster%20with%20IaC.md) file in the root directory of the project.

## Milestone 7: Kubernetes Deployment to AKS

1. **Deployment Manifests** Defined the Deployment and Service manifests for our application. The Deployment manifest, named `flask-app-deployment`, helps deploy our containerized web application onto the Terraform-provisioned AKS cluster.

2. **Service Manifests** Defined a Service in the same `application-manifest.yaml` file. The Service manifest, named `flask-app-service`, facilitates internal communication within the AKS cluster.

3. **Deployment Strategy** Implemented the Rolling Updates deployment strategy. During updates, a maximum of one pod deploys while one pod becomes temporarily unavailable, maintaining application availability.

4. **Testing and Validation** Tested and validated by performing port forwarding to a local machine using the `kubectl port-forward <pod-name> 5000:5000` command, which allowed us to interact with our application locally. Accessed web application locally at `http://127.0.0.1:5000` and thoroughly tested its functionality.

5. **Distribution Plan** For internal users within our organization, we plan to distribute the application by providing them with access to the AKS cluster. They can then access the application within the cluster without relying on port forwarding. To share the application with external users, we would consider exposing our service to the internet by changing the service type from ClusterIP to LoadBalancer. This would provide an externally accessible IP address. However, we would need to implement additional security measures, such as authentication and authorization mechanisms, to ensure secure access.

Detailed documentation of the process can be found in the [Documentation - Kubernetes Deployment to AKS.md](https://github.com/a-maruf/Web-App-DevOps-Project/blob/main/Documentation%20-%20Kubernetes%20Deployment%20to%20AKS.md) file in the root directory of the project.

## Milestone 8: CI/CD Pipeline with Azure DevOps

This milestone uses a Continuous Integration/Continuous Deployment (CI/CD) pipeline in Azure DevOps for automatic deployment of the application. 
 
1. **Create an Azure DevOps Project** A new Azure DevOps project named 'Web-App-Azure-DevOps-Project' was created. This serves as the foundation for the CI/CD pipeline setup. 
 
2. **Initiate Azure DevOps Pipeline Setup** The process of creating an Azure DevOps Pipeline was initiated. The source repository for the pipeline was configured to be the GitHub repository 'a-maruf/Web-App-DevOps-Project'. The pipeline was created using a Starter Pipeline template. 
 
3. **Establish an Azure DevOps-Docker Hub Connection** A service connection was set up between Azure DevOps and Docker Hub. This connection facilitates the seamless integration of the CI/CD pipeline with the Docker Hub container registry. 
 
4. **Configure Pipeline for Docker Image Build and Push** The pipeline was modified to enable it to build and push a Docker image to Docker Hub. The pipeline is set up to automatically run each time there is a push to the main branch of the application repository. 
 
5. **Establish an Azure DevOps-AKS Connection** An AKS service connection was created and configured within Azure DevOps. This service connection establishes a secure link between the CI/CD pipeline and the AKS cluster. 
 
6. **Configure Pipeline for Kubernetes Deployment** The CI/CD pipeline was modified to incorporate the Deploy to Kubernetes task with the deploy kubectl command. This step leverages the deployment manifest available in the application repository, as well as the previously established ASK connection to facilitate the automatic deployment of the application to the AKS cluster. 
 
7. **Testing and Validation of CI/CD** The functionality of the application was tested by accessing it through port forwarding. The application was accessed by navigating to `localhost:5000` in a web browser. This validates the effectiveness of the CI/CD pipeline in application deployment.

Detailed documentation of the process can be found in the [Documentation - CICD Pipeline with Azure DevOps.md](https://github.com/a-maruf/Web-App-DevOps-Project/blob/main/Documentation%20-%20CICD%20Pipeline%20with%20Azure%20DevOps.md) file in the root directory of the project.

## Milestone 9: AKS Cluster Monitoring

This milestone focuses on ensuring effective monitoring and alerting for the AKS cluster, which is the backbone of our application's deployment strategy.

1. **Enable Container Insights for AKS** Container Insights was enabled for our AKS cluster.

2. **Create Metric Explorer Charts** Created and configured the following charts in Metrics Explorer: `Average Node CPU Usage`, `Average Pod Count`, `Used Disk Percentage`, and `Bytes Read and Written per Second`.

3. **Log Analytics Configuration** Configured Log Analytics to execute and save the following logs: `Average Node CPU Usage Percentage per Minute`, `Average Node Memory Usage Percentage per Minute`, `Pods Counts with Phase`, `Find Warning Value in Container Logs`, and `Monitoring Kubernetes Events`.

4. **Set Up Disk Used Percentages Alarm** Set up an alert rule to trigger an alarm when the used disk percentage in the AKS cluster exceeds 90%.

5. **Modify CPU and Memory Alert Rules** Adjusted the alert rules for CPU usage and memory working set percentage to trigger when they exceed 80%. CPU and memory are critical resources in our AKS cluster.

Detailed documentation of the process can be found in the [Documentation - AKS Cluster Monitoring.md](https://github.com/a-maruf/Web-App-DevOps-Project/blob/main/Documentation%20-%20AKS%20Cluster%20Monitoring.md) file in the root directory of the project.

## Milestone 10: AKS Integration with Azure Key Vault for Secrets Management

This milestone focuses on integrating Azure Kubernetes Service (AKS) with Azure Key Vault for secure management of secrets. The tasks include creating an Azure Key Vault, assigning the Key Vault Administrator role, creating secrets in Key Vault, enabling managed identity for AKS, assigning permissions to the managed identity, updating the application code, and conducting end-to-end testing in AKS.

1. **Create an Azure Key Vault** An Azure Key Vault was created for securely storing and accessing secrets.

2. **Assign Key Vault Administrator Role** The Key Vault Administrator role was assigned to the Microsoft Entra ID user to manage secrets within the Key Vault.

3. **Create Secrets in Key Vault** Four secrets were created in the Key Vault to secure the credentials used within the application to connect to the backend database.

4. **Enable Managed Identity for AKS** Managed identity was enabled for the AKS cluster to allow it to authenticate and interact securely with the Key Vault.

5. **Assign Permissions to Managed Identity** The Key Vault Secrets Officer role was assigned to the managed identity associated with AKS, allowing it to retrieve and manage secrets.

6. **Update the Application Code** The Azure Identity and Azure Key Vault libraries were integrated into the Python application code. The code was modified to use managed identity credentials for secure retrieval of database connection details from the Key Vault.

7. **End-to-End Testing in AKS** Thorough testing of the modified application was conducted locally and within the AKS environment. The application was able to securely retrieve and utilize the database connections details from Key Vault using managed identity credentials.

Detailed documentation of the process can be found in the [Documentation - AKS Integration with Azure Key Vault for Secrets Management.md](https://github.com/a-maruf/Web-App-DevOps-Project/blob/main/Documentation%20-%20AKS%20Integration%20with%20Azure%20Key%20Vault%20for%20Secrets%20Management.md) file in the root directory of the project.