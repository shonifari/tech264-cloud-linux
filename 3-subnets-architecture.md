# Create the 3-subnet architecture to make the database private

- [Create the 3-subnet architecture to make the database private](#create-the-3-subnet-architecture-to-make-the-database-private)
  - [Set up the Virtual Network](#set-up-the-virtual-network)
    - [Basics](#basics)
    - [IP addresses](#ip-addresses)
    - [Review and Create](#review-and-create)
  - [Create Database VM](#create-database-vm)
    - [Basics](#basics-1)
    - [Review and Create](#review-and-create-1)
  - [Create the App VM](#create-the-app-vm)
    - [Basics](#basics-2)
    - [Networking](#networking)
    - [Advanced](#advanced)
    - [Review and Create](#review-and-create-2)
  - [Create a virtual machine for the NVA](#create-a-virtual-machine-for-the-nva)
    - [Basics](#basics-3)
    - [Networking](#networking-1)
    - [Review and Create](#review-and-create-3)
  - [Why This Architecture Makes the Database More Secure](#why-this-architecture-makes-the-database-more-secure)
    - [Isolation of Resources](#isolation-of-resources)
    - [Controlled Access](#controlled-access)
    - [Network Security](#network-security)
    - [Availability Zones](#availability-zones)
  - [Route Tables](#route-tables)
    - [Review and Create](#review-and-create-4)
    - [Routes under Settings](#routes-under-settings)
    - [Subnet under Settings](#subnet-under-settings)
    - [Network Settings under Networking for your NVA](#network-settings-under-networking-for-your-nva)
    - [Now, we have to enable it on Linux](#now-we-have-to-enable-it-on-linux)
  - [Creating IP Table Rules](#creating-ip-table-rules)
  - [Set Network Security Group Rules](#set-network-security-group-rules)
  - [Create a rule to deny everything else](#create-a-rule-to-deny-everything-else)

## Set up the Virtual Network

![3 Subnet Architecture](<images/tech264 - 3 subnets architecture.png>)

### Basics

1. Name appropriately (tech264-name-in-3-subnet-vnet-db-vm)

### IP addresses

1. Edit **default subnet**, rename to **public-subnet** and change **starting address** to `10.0.2.0`.
2. Add a new subnet, rename to **dmz-subnet** and change **starting address** to `10.0.3.0`.
3. Add another new subnet for private subnet, rename to **private-subnet** and change **starting address** to `10.0.4.0` and enable **private subnet**. This means that whatever you put in this subnet cannot access the internet.

### Review and Create

1. **Ensure** you've selected the correct options.
2. **Create** your shiny new secure virtual network.

## Create Database VM

Follow the usual **DATABASE** steps with these slight changes...

### Basics

1. Select **zone 3** for availability zone assigned to the DB.
2. Select the previously created virtual network and select the private subnet. `10.0.4.0`
3. Disable public IP address.
4. Only enable **SSH port**.

### Review and Create

1. **Ensure** you've selected the correct options.
2. **Create** your shiny new DB.

Once this is done, we create the application that will connect to the database and display the information.

## Create the App VM

Follow the usual **APP** steps with these slight changes...

### Basics

1. Select **zone 1** for availability zone assigned to the App.

### Networking

1. Select public subnet.

### Advanced

1. Enable **user data** and input your script to run the image.
2. Change the **IP** in the **export line** to the **private IP** of the **DB** we created previously.

### Review and Create

1. **Ensure** you've selected the correct options.
2. **Create** your shiny new App.

Now we create the VM for the Network Virtual Appliance (NVA). This performs network functions like routing, firewalling, traffic filtering, and load balancing.

## Create a virtual machine for the NVA

### Basics

1. Name it appropriately (tech264-name-in-3-subnet-nva).
2. Select **zone 2** for availability zone assigned to the NVA.
3. Select **Standard security** as it may have changed.
4. Select **see all images** and find the **clean-image**.
5. Leave SSH as the only port.

### Networking

1. Use the **DMZ subnet**.
2. Leave the public IP initially. Later on, if we used in production, we wouldn't.

### Review and Create

1. **Ensure** you've selected the correct options.
2. **Create** your shiny new NVA.

## Why This Architecture Makes the Database More Secure

### Isolation of Resources

- **Private Subnet:** The database is placed in a private subnet (`10.0.4.0`) which has no direct access to the internet. This isolation ensures that the database is not exposed to external threats and can only be accessed through internal network routes.
- **DMZ Subnet:** The Network Virtual Appliance (NVA) is placed in the DMZ subnet (`10.0.3.0`), acting as a buffer zone between the public internet and the private network. This adds an additional layer of security by filtering and controlling traffic before it reaches the private subnet.

### Controlled Access

- **No Public IP for Database:** By disabling the public IP address for the database VM, we ensure that it cannot be accessed directly from the internet. Access is only possible through the internal network, typically via the NVA.
- **SSH Access Only:** Limiting the open ports to only SSH for administrative access reduces the attack surface, minimizing potential vulnerabilities.

### Network Security

- **Network Virtual Appliance (NVA):** The NVA performs critical security functions such as routing, firewalling, and traffic filtering. It ensures that only legitimate traffic reaches the database, providing an additional layer of defense against unauthorized access and attacks.

### Availability Zones

- **Availability Zones:** By distributing the VMs across different availability zones (zone 1 for the App, zone 2 for the NVA, and zone 3 for the DB), we enhance the resilience and availability of the architecture. This setup ensures that even if one zone experiences an issue, the other components remain operational.

By implementing this 3-subnet architecture, we create a robust and secure environment for the database, protecting it from external threats and ensuring controlled access through well-defined network boundaries.

---

## Route Tables

Used to define how network traffic is directed within a network and between different networks.

1. Select **tech264** resource group.
2. For **Region**, Select **UK South**.

### Review and Create

1. **Ensure** you've selected the correct options. There isn't really much here, really.
2. **Create** your shiny new Route table.

Once it's created, navigate to the resource.

### Routes under Settings

1. Click **Routes**.
2. Click **Add**.
3. For the **route name**, input `to-private-subnet-route`.
4. For the **destination type**, select **IP addresses**.
5. For **Destination IP addresses/CIDR ranges**, we use the private subnet: `10.0.4.0/24`.
6. For the next **hop type**, select **Virtual appliance**.
7. For the next **hop address** input the **IP** of the NVA: `10.0.3.4`.
8. Select **Add**.

Now we need to associate the route table to where the traffic comes out of.

### Subnet under Settings

1. Click **Associate**.
2. Choose your virtual network.
3. Select the **public-subnet**.

### Network Settings under Networking for your NVA

1. Select the **Network Interface / IP configuration** link.
2. Enable **IP forwarding** and click **Apply**.

### Now, we have to enable it on Linux

***Remember!** you need to update and upgrade on new VMs.*

1. **SSH** into your **NVA**.
2. Input `sysctl net.ipv4.ip_foward` to check if IP forwarding is enabled. If it reads **0**, it's false.
3. Input `sudo nano /etc/sysctl.conf` to enter the config file where we can enable it.
4. You will need to uncomment the line to enable it. Ensure you do the correct **IPv type**. In our case, it's **IPv4**.
5. If you run another check, it'll read as 0 still. So, we need to apply to configuration file changes by reloading it. We can use `sudo sysctl -p`. It will then print that the setting has been changed.

If your `ping (DB Private IP)` command was running on another window, you'll see that it has resumed, meaning the packets are now being forwarded to the DB VM through the NVA. This also shows that the route table is working correctly.

## Creating IP Table Rules

We need a script that will contain the rules we're going to set. SSH into your NVA.

1. Create a file called `nano config-ip-tables.sh`, where will write the script.
2. Copy the following script: [config-ip-tables.sh](deploying-apps/configuring-ip-tables-script.md)
3. Grant yourself execute permissions using `chmod +x config-ip-tables.sh`.
4. Run your script with `./config-ip-tables.sh`.

## Set Network Security Group Rules

1. Navigate to your **DB virtual machine**.
2. Go to **Network Settings** under **Networking**.
3. Open the **Network security group**.
4. Go to **inbound port rules** and click **Add**.
5. Under **Source**, select **IP addresses**.
6. Under **Source IP addresses/CIDR ranges**, input the **public subnet IP** `10.0.2.0/24`.
7. Change the service to MongoDB.
8. Change the name appropriately.

## Create a rule to deny everything else

1. **Add** another rule.
2. Input a `*` to the **destination port ranges**.
3. Change the priority to `500`.

*That's it! You've officially secured your app with a DMZ layer. Good stuff. Now delete it all.*
