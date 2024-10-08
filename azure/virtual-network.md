# Virtual Networks

- [Virtual Networks](#virtual-networks)
  - [How to create a VNet on Azure?](#how-to-create-a-vnet-on-azure)
  - [Delete an Azure VNet](#delete-an-azure-vnet)
  - [How to add a port](#how-to-add-a-port)

## How to create a VNet on Azure?

A Virtual Network (VNet) is essential for running virtual machines (VMs) in the cloud. Each VM fits into a subnet within a VNet.

- A virtual machine is a cloud-based computer that you can run from your local machine.
- Name the VNet using the naming convention
- The VNet `tech264-karis-2-subnet-vnet` uses a CIDR block of `10.0.0.0/16`, which provides 65,536 IP addresses.
- Create two subnets:
  - **Public Subnet** (accessible to everyone):
    - CIDR block: `10.0.2.0/24` (256 possible addresses)
  - **Private Subnet** (secured later):
    - CIDR block: `10.0.3.0/24`
- Adjust CIDR blocks as needed.
- Make sure to modify the starting address and use only IPv4.
- Add the owner tag for identification.
- Review and create the VNet.

## Delete an Azure VNet

To delete a VNet, follow these steps:

1. Search for **Resource Groups**.
2. View everything in the resource group.
3. Click into the VNet you want to delete.
4. Click the three dots in the upper-right corner and select **Delete**.

## How to add a port

1. Navigate to your VM's **network settings**.
2. Open up **Settings** and click **inbound security rules**.
3. Change the **destination port** to `3000`.
4. Change protocol to **TCP**.
5. Change the priority. The **lower** the priority, the **higher** the priority.
