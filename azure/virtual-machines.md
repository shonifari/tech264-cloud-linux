# Virtual Machine

- [Virtual Machine](#virtual-machine)
  - [What is a virtual machine?](#what-is-a-virtual-machine)
  - [How to plan  to create a VM?](#how-to-plan--to-create-a-vm)
  - [How to create a VM in Azure](#how-to-create-a-vm-in-azure)
  - [Connecting to a VM](#connecting-to-a-vm)
  - [Disconnecting from a VM](#disconnecting-from-a-vm)

## What is a virtual machine?

## How to plan  to create a VM?

Things to consider:

- Virtual network & subnet
- Name (according to convention)
- Location & Pricing
- Storage
- Size
- Operating System (compatability)
- SSH Key pair

## How to create a VM in Azure

- **Basics**
  
  1. Select **Resource Group**
  2. Select **Region**
  3. Select **Availability** Options:

     - No infrastructure redundancy required
     - Choose appropriate availability

  4. Select **security**
  5. Select correct **Image** (OS & Files Snapshot)
  6. Select apporpriate **size**
  7. Rename **username** to prevent hackers to know it
  8. Choose existing or generate **SSH key**
  9. Select **allowed inbound ports**

- **Disk**
    1. Change to **standard SSD** (Locally redundant)

- **Networking**
    1. Select **virtual network**
    2. Select correct **public subnet**

- **Networking**
    1. Select virtual networkk
    2. Select correct **public** subnet

## Connecting to a VM

We can connect to a VM through [SSH](../ssh/README.md)

```bash
ssh -i ~/.ssh/<ssh_private_key> <user>@<public_ip_address>
```

## Disconnecting from a VM

```bash
exit
```
