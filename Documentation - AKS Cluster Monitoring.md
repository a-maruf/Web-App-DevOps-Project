# Milestone 9: AKS Cluster Monitoring

This milestone focuses on ensuring effective monitoring and alerting for the AKS cluster, which is the backbone of our application's deployment strategy.

## Task 1: Enable Container Insights for AKS

Container Insights was enabled for our AKS cluster. This tool collects real-time performance and diagnostic data, allowing us to monitor application performance and troubleshoot issues effectively.

## Task 2: Create Metric Explorer Charts

We created and configured the following charts in Metrics Explorer:

- **Average Node CPU Usage**: This chart tracks the CPU usage of our AKS cluster's nodes. Monitoring CPU usage helps ensure efficient resource allocation and detect potential performance issues.
- **Average Pod Count**: This chart displays the average number of pods running in our AKS cluster. It's a key metric for evaluating the cluster's capacity and workload distribution.
- **Used Disk Percentage**: Monitoring disk usage is critical to prevent storage-related issues. This chart helps us track how much disk space is being utilized.
- **Bytes Read and Written per Second**: Monitoring data I/O is crucial for identifying potential performance bottlenecks. This chart provides insights into data transfer rates.

    ![Azure-Monitoring-Insights.png](https://github.com/a-maruf/Web-App-DevOps-Project/blob/main/Images/Azure-Monitoring-Insights.png)

## Task 3: Log Analytics Configuration

We configured Log Analytics to execute and save the following logs:

- **Average Node CPU Usage Percentage per Minute**: This configuration captures data on node-level usage at a granular level, with logs recorded per minute. Monitoring CPU usage helps ensure that the cluster is operating efficiently and that there is no over-utilization or resource starvation.
- **Average Node Memory Usage Percentage per Minute**: Similar to CPU usage, tracking memory usage at node level allows us to detect memory-related performance concerns and efficiently allocate resources. Identifying memory-intensive workloads or potential memory leaks is essential for maintaining the health of the AKS cluster.
- **Pods Counts with Phase**: This log configuration provides information on the count of pods with different phases, such as Pending, Running, or Terminating. It offers insights into pod lifecycle management and helps ensure the cluster's workload is appropriately distributed.
- **Find Warning Value in Container Logs**: By configuring Log Analytics to search for warning values in container logs, we proactively detect issues or errors within our containers, allowing for prompt troubleshooting and issues resolution.
- **Monitoring Kubernetes Events**: Monitoring Kubernetes events, such as pod scheduling, scaling activities, and errors, is essential for tracking the overall health and stability of the cluster.

    ![Azure-Monitoring-Logs.png](https://github.com/a-maruf/Web-App-DevOps-Project/blob/main/Images/Azure-Monitoring-Logs.png)

## Task 4: Set Up Disk Used Percentages Alarm

We set up an alert rule to trigger an alarm when the used disk percentage in the AKS cluster exceeds 90%. This alert helps us proactively detect and address potential disk issues that could lead to performance degradation and service interruptions.

![Azure-Monitoring-DiskUsedPercentagesAlarm.png](https://github.com/a-maruf/Web-App-DevOps-Project/blob/main/Images/Azure-Monitoring-DiskUsedPercentagesAlarm.png)

## Task 5: Modify CPU and Memory Alert Rules

We adjusted the alert rules for CPU usage and memory working set percentage to trigger when they exceed 80%. CPU and memory are critical resources in our AKS cluster. When they are heavily utilized, it can lead to decreased application performance. By setting alert rules to trigger at 80%, we ensure that we are notified when these resources are approaching critical levels.

![Azure-Monitoring-CPU-Usage.png](https://github.com/a-maruf/Web-App-DevOps-Project/blob/main/Images/Azure-Monitoring-CPU-Usage.png)

![Azure-Monitoring-MemoryWorkingSetPercentage.png](https://github.com/a-maruf/Web-App-DevOps-Project/blob/main/Images/Azure-Monitoring-MemoryWorkingSetPercentage.png)