# Microsoft Azure

- [Microsoft Azure](#microsoft-azure)
  - [What is Azure?](#what-is-azure)
  - [How to create a VNet on Azure?](#how-to-create-a-vnet-on-azure)
  - [Delete an Azure VNet](#delete-an-azure-vnet)

## What is Azure?

[Intro to Azure](intro-to-azure.md)

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
