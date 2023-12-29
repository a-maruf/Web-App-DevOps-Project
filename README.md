# Azure End-to-End DevOps Pipeline Project

This project involves building a comprehensive end-to-end DevOps pipeline to support an internal web application designed to manage and monitor deliveries across the company. The project is divided into ten milestones, each with several tasks.

## Table of Contents
1. [Project Overview](#project-overview)
2. [Milestone 1: Set up the Environment](#milestone-1-set-up-the-environment)
3. [Milestone 2: Version Control](#milestone-2-version-control)
4. [Upcoming Milestones](#upcoming-milestones)

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

## Upcoming Milestones
The upcoming milestones in the project include:

- Milestone 3: Containerization with Docker
- Milestone 4: Defining Networking Services with IaC
- Milestone 5: Defining an AKS Cluster with IaC
- Milestone 6: Create an AKS Cluster with IaC
- Milestone 7: Kubernetes Deployment to AKS
- Milestone 8: CI/CD Pipeline with Azure DevOps
- Milestone 9: AKS Cluster Monitoring
- Milestone 10: AKS Integration with Azure Key Vault for Secrets Management

These milestones will be updated as they are completed.
