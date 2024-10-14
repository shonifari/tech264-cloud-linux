# Create the 3-subnet architecture to make the database private

## Set up the Virtual Network

![3 Subnet Architecture](<images/tech264 - 3 subnets architecture.png>)

### Basics

1. Name appropriately (tech264-name-in-3-subnet-vnet-db-vm)

### IP addresses

1. Edit **default subnet**, rename to **public-subnet** and change **starting address** to `10.0.1.0`.
2. Add a new subnet, rename to **dmz-subnet** and change **starting address** to `10.0.3.0`.
3. Add another new subnet for private subnet, rename to **private-subnet** and change **starting address** to `10.0.4.0` and enable **private subnet**. This means that whatever you put in this subnet cannot access the internet.

### Tags

1. Select owner and your name.

### Review and Create

1. **Ensure** you've selected the correct options.
2. **Create** your shiny new secure virtual network.

Then we create a virtual machine using our database image. We start with the database as we follow the 2-tier architecture structure.

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

1. Enable **user data** and input your `image script` (script you use to run the image).
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
