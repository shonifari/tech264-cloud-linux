# Azure Cloud Architecture

- [Azure Cloud Architecture](#azure-cloud-architecture)
  - [Virtual Network (VNet)](#virtual-network-vnet)
  - [Subnet](#subnet)
  - [Resource Group](#resource-group)
  - [Disk](#disk)
  - [Public IP](#public-ip)
  - [NSG Rule - Allow HTTP](#nsg-rule---allow-http)
  - [NSG Rule - Allow SSH](#nsg-rule---allow-ssh)
  - [Region](#region)
  - [SSH Key](#ssh-key)
  - [Network Interface Controller (NIC)](#network-interface-controller-nic)
  - [Virtual Machine (VM)](#virtual-machine-vm)
  - [Network Security Group (NSG)](#network-security-group-nsg)

![text](../images/vm_architecture_diagram.pdf)

## Virtual Network (VNet)

A **Virtual Network (VNet)** provides an isolated network where you can securely deploy and manage resources such as virtual machines (VMs). VNets allow for communication between resources in the same network and can be connected to on-premises networks.

## Subnet

A **Subnet** is a range of IP addresses within a Virtual Network (VNet). Subnets allow you to segment your VNet into smaller networks, helping to organize resources and apply security rules more efficiently.

## Resource Group

A **Resource Group** is a container used to organize and manage related cloud resources such as virtual machines, storage, and networks. It allows for easier management, monitoring, and billing of these resources.

## Disk

A **Disk** in cloud environments is virtual storage attached to a Virtual Machine (VM). Disks store operating systems, applications, and data.

## Public IP

A **Public IP** address allows resources like Virtual Machines (VMs) to communicate with the internet. It provides external-facing connectivity to your cloud resources.

## NSG Rule - Allow HTTP

An **NSG (Network Security Group) rule to allow HTTP** traffic permits inbound and/or outbound web traffic, typically used for web applications. This rule allows public HTTP access to resources like web servers.

## NSG Rule - Allow SSH

An **NSG rule to allow SSH** traffic permits inbound connections, enabling remote access to a Virtual Machine (VM) through a Secure Shell (SSH) protocol.

## Region

A **Region** refers to a geographical location where cloud resources are deployed. Each region consists of multiple data centers and provides redundancy, lower latency, and compliance with data sovereignty regulations.

## SSH Key

An **SSH Key** is a pair of cryptographic keys (public and private) used for secure authentication when accessing Virtual Machines (VMs). The private key is kept by the user, and the public key is stored in the VM.

## Network Interface Controller (NIC)

A **Network Interface Controller (NIC)** is the virtualized hardware that allows a Virtual Machine (VM) to connect to a network. Each NIC is assigned an IP address and provides communication between the VM and other resources.

## Virtual Machine (VM)

A **Virtual Machine (VM)** is a scalable compute resource that runs on virtualized hardware in the cloud. VMs allow users to run applications and workloads without needing to maintain physical servers.

## Network Security Group (NSG)

A **Network Security Group (NSG)** is a set of security rules that control inbound and outbound network traffic to resources in a Virtual Network (VNet), such as Virtual Machines (VMs) and subnets. NSGs help secure cloud environments by allowing or denying traffic based on various criteria.
