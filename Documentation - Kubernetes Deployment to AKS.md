# Milestone 7: Kubernetes Deployment to AKS

## Deployment and Service Manifests

In this project, we defined the Deployment and Service manifests for our application. 

### Deployment Manifest

The Deployment manifest, named `flask-app-deployment`, helps deploy our containerized web application onto the Terraform-provisioned AKS cluster. Here's the detailed breakdown of the Deployment manifest:

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: flask-app-deployment
spec:
  replicas: 2
  selector:
    matchLabels:
      app: flask-app
  template:
    metadata:
      labels:
        app: flask-app
    spec:
      containers:
      - name: flask-app
        image: <DockerHubUsername>/<ImageName>:<Tag>
        ports:
        - containerPort: 5000
        imagePullPolicy: Always
  strategy:
    type: RollingUpdate
    rollingUpdate:
      maxUnavailable: 1
      maxSurge: 1
```

In the above manifest:

- `apiVersion: apps/v1` and `kind: Deployment` specify that we're creating a Deployment.
- `metadata: name: flask-app-deployment` sets the name of the Deployment.
- `spec: replicas: 2` specifies that the application should concurrently run on two replicas within the AKS cluster.
- `selector: matchLabels: app: flask-app` sets a label that uniquely identifies our application.
- `template: metadata: labels: app: flask-app` sets the same label for the pods created by the Deployment.
- `spec: containers: - name: flask-app` and `image: <DockerHubUsername>/<ImageName>:<Tag>` specify the container image to be used for deployment.
- `ports: - containerPort: 5000` exposes port 5000 for communication within the AKS cluster.
- `strategy: type: RollingUpdate` and `rollingUpdate: maxUnavailable: 1 maxSurge: 1` implement the Rolling Updates deployment strategy.

### Service Manifest

Next, we defined a Service in the same `application-manifest.yaml` file. Here's the detailed breakdown of the Service manifest:

```yaml
---
apiVersion: v1
kind: Service
metadata:
  name: flask-app-service
spec:
  selector:
    app: flask-app
  ports:
    - protocol: TCP
      port: 80
      targetPort: 5000
  type: ClusterIP
```

In the above manifest:

- `apiVersion: v1` and `kind: Service` specify that we're creating a Service.
- `metadata: name: flask-app-service` sets the name of the Service.
- `spec: selector: app: flask-app` ensures that the traffic is efficiently directed to the appropriate pods.
- `ports: - protocol: TCP port: 80 targetPort: 5000` configures the service to use TCP protocol on port 80 for internal communication within the cluster.
- `type: ClusterIP` sets the service type to ClusterIP, designating it as an internal service within the AKS cluster.

## Deployment Strategy

We implemented the Rolling Updates deployment strategy. This strategy facilitates seamless application updates. During updates, a maximum of one pod deploys while one pod becomes temporarily unavailable, maintaining application availability. This strategy aligns with our application's requirements as it ensures that our application remains available even during updates.

## Testing and Validation

After deploying our application, we tested and validated it by performing port forwarding to a local machine. Here are the steps we followed:

1. We check which clusters/context are avaiable, which one we are in, and if required, changing context by using the following command:

```bash
kubectl config get-contexts
kubectl config current-context
kubectl config use-context <context name>
```

2. We verified the status and details of our deployments, services and pods within the AKS cluster using the following commands:

```bash
kubectl get deployments
kubectl get svc
kubectl get pods
```

3. We initiated port forwarding using the following command:

```bash
kubectl port-forward <pod-name> 5000:5000
```

4. We accessed our web application locally at `http://127.0.0.1:5000` and thoroughly tested its functionality. We paid particular attention to the orders table, ensuring that it was displayed correctly and that we could successfully use the Add Order functionality.

## Distribution Plan

For internal users within our organization, we plan to distribute the application by providing them with access to the AKS cluster. They can then access the application within the cluster without relying on port forwarding.

If the need arises to share the application with external users, we would consider exposing our service to the internet by changing the service type from ClusterIP to LoadBalancer. This would provide an externally accessible IP address. However, we would need to implement additional security measures, such as authentication and authorization mechanisms, to ensure secure access.