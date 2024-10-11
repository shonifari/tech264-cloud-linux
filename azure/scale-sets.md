# VM Scale Set Provisioning and Management

This documentation provides a step-by-step guide to creating, testing, and managing a Virtual Machine Scale Set (VMSS) in Azure. It includes explanations, a diagram, and detailed instructions.

## Table of Contents

1. Introduction
2. Steps to Create a VM Scale Set
3. Testing the VM Scale Set
4. Diagram of VM Scale Set
5. Load Balancer Explanation
6. Managing Instances
7. Creating an Unhealthy Instance
8. SSH into an Instance
9. Deleting a VM Scale Set

## Introduction

A Virtual Machine Scale Set (VMSS) allows you to deploy and manage a set of identical, auto-scaling virtual machines. This guide will walk you through the process of creating a VMSS, testing its functionality, and managing its instances.

## Steps to Create a VM Scale Set

### Basics

1. **Search "scale set"** in the top search bar and click **Virtual Machine Scale Set**.
2. **Assign** resource group `(tech264)`.
3. **Name** the VM (e.g., `tech264-name`).
4. Set **region** to `(Europe) UK South`.
5. Select all 3 availability zones.
6. Under **orchestration mode**, select `uniform`.
7. Set the security type to `standard`.
8. For **scaling**, select `autoscaling`. A window will appear below it - click **configure**.
9. Select the pencil for the default condition to edit it.
10. Input **3** for the maximum instances / VMs.
11. Input **75** for the CPU threshold greater than.
12. Select **Save**.
13. Once returned to the basics page, select "see all images".
14. Select "my images" and search for your image - then **select**.
15. Change **username** to something more secure.
16. Change SSH public key source to `Use existing key stored in Azure`.
17. Select **your** Stored key (e.g., `tech264`).

### Disks

1. Change OS Disk type to `Standard SSD (locally redundant storage)`.

### Networking

1. For the **Virtual network**, select your subnet.
2. Edit your **Network Interface**.
3. Select allow selected ports, then enable `SSH(22)` and `HTTP(80)`.
4. Ensure public IP address is **disabled** as the load balancer will handle this now.
5. Apply those changes and you will be returned to the Networking screen.
6. Select **Create a load balancer**.
7. Change the name to your naming conventions with "lb" on the end of it, to label it as a **load balancer**.
8. Select **Create**. This will take up the "Select load balancer" slot.

### Health

1. **Tick** the box labelled "Enable application health monitoring".
2. **Tick** the box labelled "Automatic repairs".

### Advanced

1. **Tick** the box "Enable user data" to allow an input and insert:

    ```bash
    #!/bin/bash

    echo "Change directory to app"
    cd repo/app
    echo "In app directory"

    # Stop all existing pm2 processes
    pm2 stop all

    echo "start"
    pm2 start app.js
    echo "App started with pm2"
    ```

### Tags

1. Select owner and your name.

### Review and Create

1. **Ensure** you've selected the correct options.
2. **Create** your shiny new VM scale set.

## Testing the VM Scale Set

1. **Verify Deployment**: Ensure the VMSS is deployed successfully.
2. **Check Instances**: Verify that the instances are created and running.
3. **Load Balancer**: Test the load balancer by accessing the application through its public IP.

## Diagram of VM Scale Set

![VM Scale Set Diagra](<../images/Scale Sets.png>)

## Load Balancer Explanation

A load balancer distributes incoming network traffic across multiple servers to ensure no single server becomes overwhelmed. It improves application availability and reliability by distributing the load and providing redundancy.

## Managing Instances

1. **Scale Up/Down**: Adjust the number of instances based on demand.
2. **Monitor Health**: Use Azure Monitor to keep track of instance health and performance.
3. **Automatic Repairs**: Enable automatic repairs to replace unhealthy instances.

## Creating an Unhealthy Instance

![Unhealthy VM](<../images/Unhealthy VM.png>)

1. **Simulate Failure**: Change User Data.
2. **Delete instance**: Force Scale Set to recreate a VM
3. **Monitor Health**: Check the new instance status in the Azure portal.
4. **Unhealthy Status**: The instance will be marked as unhealthy if it fails health checks.

## SSH into an Instance

1. **Get Load Balancer IP Address**: Obtain the public IP address of the instance.
2. **Use the correct port in increments starting from 50000**
3. **SSH Command**: Use the following command to SSH into the instance:

    ```bash
    ssh -i /path/to/your/private/key -p 50000 username@private-ip-address
    ```

## Deleting a VM Scale Set

1. **Navigate to VMSS**: Go to the VM Scale Set in the Azure portal.
2. **Delete VMSS**: Select the VMSS and click on **Delete**.
3. **Confirm Deletion**: Confirm the deletion of the VMSS and all its associated resources:
   * Scale Set NIC (Network Interface Controller)
   *  
