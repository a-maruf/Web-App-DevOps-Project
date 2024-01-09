# Milestone 8: CI/CD Pipeline with Azure DevOps 
 
This project uses a Continuous Integration/Continuous Deployment (CI/CD) pipeline in Azure DevOps for automatic deployment of the application. 
 
## Task 1: Create an Azure DevOps Project 
 
A new Azure DevOps project named 'Web-App-Azure-DevOps-Project' was created. This project serves as the foundation for the CI/CD pipeline setup. The project was created within the Azure DevOps account associated with the Azure account that was created at the beginning of this project. 
 
## Task 2: Initiate Azure DevOps Pipeline Setup 
 
The process of creating an Azure DevOps Pipeline was initiated. The source repository for the pipeline was configured to be the GitHub repository 'a-maruf/Web-App-DevOps-Project'. The pipeline was created using a Starter Pipeline template, which serves as the foundation for further customization. This was modified to be in a 'clean-slate' to later modify.

Steps to create a pipeline included:
- Go to Pipelines, and then select New pipeline or Create pipeline if creating your first pipeline.
- Do the steps of the wizard by first selecting GitHub as the location of your source code.
- You might be redirected to GitHub to sign in. If so, enter your GitHub credentials.
- When you see the list of repositories, select your repository.
- You might be redirected to GitHub to install the Azure Pipelines app. If so, select Approve & install.
- Azure Pipelines will analyze your repository and recommend the Starter Pipeline template.
- When your new pipeline appears, modify it to be in a clean-slate as follows:

```yaml
trigger:
- main

pool:
  vmImage: ubuntu-latest

steps:
```

 
## Task 3: Establish an Azure DevOps-Docker Hub Connection 
 
A service connection was set up between Azure DevOps and Docker Hub. This connection facilitates the seamless integration of the CI/CD pipeline with the Docker Hub container registry. The connection was set up by creating a personal access token on Docker Hub, configuring an Azure DevOps service connection to utilize this token, and verifying that the connection was successfully established. 

### Step 1: Create a Personal Access Token on Docker Hub

1. Sign in to Docker Hub.
2. Select your avatar in the top-right corner and from the drop-down menu select `My Account`.
3. Select the `Security` tab and then `New Access Token`.
4. Add a description for your token. Use something that indicates the use case or purpose of the token.
5. Set the access permissions.
6. Select `Generate` and then copy the token that appears on the screen and save it. You won't be able to retrieve the token once you close this prompt.

### Step 2: Configure an Azure DevOps Service Connection to Utilize this Token

1. From your Azure DevOps project, select the gear icon to navigate to your `Project settings`.
2. Select `Service connections` from the left pane.
3. Select `New service connection`, and then select `Docker Registry` then `Next`.
4. Enter your Docker Hub ID and the personal access token you generated in the previous step as the password.
5. Give the connection a meaningful name and then click `Verify and save`.

### Step 3: Verify the Connection

1. Go back to `Project settings > Service connections`.
2. Select the service connection that you just created.
3. Click `Verify this connection`.
 
## Task 4: Configure Pipeline for Docker Image Build and Push 
 
The pipeline was modified to enable it to build and push a Docker image to Docker Hub. The Docker task was added to the pipeline with the buildAndPush command. The Docker image name was set to be the same as previously when pushing to Docker Hub from the local development environment. The pipeline is set up to automatically run each time there is a push to the main branch of the application repository. After running the CI/CD pipeline, the newly created Docker image was tested by pulling the latest version from Docker Hub on the local environment, running the container, and testing its functionality. The `azure-pipelines.yml` file should look similar to the following:

```yaml
trigger:
- main

pool:
  vmImage: ubuntu-latest

steps:
- task: Docker@2
  displayName: Build and push Docker image
  inputs:
    containerRegistry: 'Docker-Service-Connection-amaruf1'
    repository: 'amaruf1/web-app-devops-project'
    command: 'buildAndPush'
    Dockerfile: '**/Dockerfile'
    tags: 'v1.0'
```

## Task 5: Establish an Azure DevOps-AKS Connection 
 
An AKS service connection was created and configured within Azure DevOps. This service connection establishes a secure link between the CI/CD pipeline and the AKS cluster, enabling seamless deployments and effective management. The service connection was set up by navigating to Project Settings in the Azure DevOps project, opening Service Connections, creating a new service connection of type Kubernetes, and configuring the service connection with the server URL of the AKS cluster and the contents of the kubeconfig file. 
 
## Task 6: Configure Pipeline for Kubernetes Deployment 
 
The CI/CD pipeline was modified to incorporate the Deploy to Kubernetes task with the deploy kubectl command. This step leverages the deployment manifest available in the application repository, as well as the previously established ASK connection to facilitate the automatic deployment of the application to the AKS cluster. The Deploy to Kubernetes task was added to the pipeline, and the task was configured with the necessary details for the deployment, including the Azure subscription, resource group, Kubernetes cluster, and Kubernetes deployment manifests. The `azure-pipelines.yml` file should look similar to the following:

```yaml
trigger:
- main

pool:
  vmImage: ubuntu-latest

steps:
- task: Docker@2
  displayName: Build and push Docker image
  inputs:
    containerRegistry: 'Docker-Service-Connection-amaruf1'
    repository: 'amaruf1/web-app-devops-project'
    command: 'buildAndPush'
    Dockerfile: '**/Dockerfile'
    tags: 'v1.0'
- task: KubernetesManifest@1
  inputs:
    action: 'deploy'
    connectionType: 'azureResourceManager'
    azureSubscriptionConnection: '<your-azure-subcription>'
    azureResourceGroup: 'networking-resource-group'
    kubernetesCluster: 'terraform-aks-cluster'
    manifests: 'application-manifest.yaml'
```
 
## Task 7: Testing and Validation of CI/CD 
 
The functionality of the application was tested by accessing it through port forwarding. The command `kubectl port-forward service/flask-app-service 5000:5000` was used to forward traffic from port 5000 on the local machine to port 5000 on the service. The application was then accessed by navigating to `localhost:5000` in a web browser. This validates the effectiveness of the CI/CD pipeline in application deployment. 