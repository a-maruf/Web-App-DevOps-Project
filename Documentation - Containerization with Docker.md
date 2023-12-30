# Docker Containerization Process for the Web App DevOps Project

This document outlines the steps taken to containerize the application, the Docker commands used throughout the project, and essential information about the Docker image. It also includes instructions for cleaning up unnecessary Docker resources.

## Table of Contents
1. [Containerization Process](#containerization-process)
2. [Building Docker Image](#building-docker-image)
3. [Running Docker Container Locally](#running-docker-container-locally)
4. [Tagging and Pushing to Docker Hub](#tagging-and-pushing-to-docker-hub)
5. [Verifying Image on Docker Hub](#verifying-image-on-docker-hub)
6. [Cleanup](#cleanup)

## Containerization Process
The application was containerized using Docker. A Dockerfile was created to define the application's environment, encapsulate all necessary dependencies, and configuration settings. The Dockerfile includes instructions to set up the Python runtime, set the working directory, copy the application files into the container, install system dependencies and Python packages, expose the necessary port, and define the startup command.

Here is the Dockerfile used for the application:

```Dockerfile
# Use an official Python runtime as a parent image
FROM python:3.8-slim

# Set the working directory in the container
WORKDIR /app

# Copy the application files into the container
COPY . /app

# Install system dependencies and ODBC driver
RUN apt-get update && apt-get install -y \
    unixodbc unixodbc-dev odbcinst odbcinst1debian2 libpq-dev gcc && \
    apt-get install -y gnupg && \
    apt-get install -y wget && \
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | apt-key add - && \
    wget -qO- https://packages.microsoft.com/config/debian/10/prod.list > /etc/apt/sources.list.d/mssql-release.list && \
    apt-get update && \
    ACCEPT_EULA=Y apt-get install -y msodbcsql18 && \
    apt-get purge -y --auto-remove wget && \  
    apt-get clean

# Install pip and setuptools
RUN pip install --upgrade pip setuptools

# Install Python packages specified in requirements.txt
RUN pip install --trusted-host pypi.python.org -r requirements.txt

# Expose port
EXPOSE 5000

# Define Startup Command
CMD ["python", "app.py"]
```

## Building Docker Image
The Docker image was built using the `docker build` command. The `-t` option was used to tag the image with a name for easy reference.

```bash
docker build -t web-app-devops-project .
```

## Running Docker Container Locally
The Docker container was run locally using the `docker run` command. The `-p` option was used to map port 5000 from the local machine to the container.

```bash
docker run -p 5000:5000 web-app-devops-project
```

## Tagging and Pushing to Docker Hub
The Docker image was tagged and pushed to Docker Hub using the `docker tag` and `docker push` commands.

```bash
docker tag web-app-devops-project ausername1/web-app-devops-project:v1.0
docker push ausername1/web-app-devops-project:v1.0
```

## Verifying Image on Docker Hub
The Docker image was verified on Docker Hub by logging into Docker Hub and confirming that the image was listed within the repository.

## Cleanup
To maintain a clean development environment, unnecessary Docker resources were removed:

- **Remove Containers**: The `docker ps -a` command was used to list all containers, including stopped ones. Unnecessary containers were removed with `docker rm <container-id>` to free up resources.

- **Remove Images**: All images were listed using `docker images -a` and unneeded images were removed with `docker rmi <image-id>` to reclaim disk space.