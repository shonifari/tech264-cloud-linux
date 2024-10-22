# Azure CLI Documentation

- [Azure CLI Documentation](#azure-cli-documentation)
  - [Introduction](#introduction)
  - [Installation](#installation)
    - [Windows](#windows)
    - [macOS](#macos)
    - [Linux](#linux)
  - [Setup](#setup)
  - [Basic Commands](#basic-commands)
    - [Resource Group](#resource-group)
    - [Virtual Machine](#virtual-machine)
    - [Storage Account](#storage-account)
  - [Conclusion](#conclusion)

## Introduction

The Azure Command-Line Interface (CLI) is a set of commands used to create and manage Azure resources. It is designed to be easy to learn and use, making it a powerful tool for developers and IT professionals.

## Installation

### Windows

1. **Download the MSI Installer**:
    - Visit the [Azure CLI download page](https://aka.ms/installazurecliwindows).
    - Download the MSI installer.

2. **Run the Installer**:
    - Open the downloaded MSI file.
    - Follow the on-screen instructions to complete the installation.

3. **Verify Installation**:
    - Open Command Prompt or PowerShell.
    - Run the following command to check the installation:

      ```bash
      az --version
      ```

### macOS

1. **Install via Homebrew**:
    - Open Terminal.
    - Run the following command:

      ```bash
      brew update && brew install azure-cli
      ```

2. **Verify Installation**:
    - Run the following command to check the installation:

      ```bash
      az --version
      ```

### Linux

1. **Install via Package Manager**:
    - For Debian/Ubuntu:

      ```bash
      curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
      ```

2. **Verify Installation**:
    - Run the following command to check the installation:

      ```bash
      az --version
      ```

## Setup

1. **Login to Azure**:
    - Open your terminal.
    - Run the following command to login:

      ```bash
      az login
      ```

    - Follow the instructions to authenticate.

2. **Set the Subscription**:
    - If you have multiple subscriptions, set the desired one:

      ```bash
      az account set --subscription "your-subscription-id"
      ```

## Basic Commands

### Resource Group

- **Create a Resource Group**:

  ```bash
  az group create --name MyResourceGroup --location eastus
  ```

- **List Resource Groups**:

  ```bash
  az group list --output table
  ```

- **Delete a Resource Group**:

  ```bash
  az group delete --name MyResourceGroup --yes --no-wait
  ```

### Virtual Machine

- **Create a Virtual Machine**:

  ```bash
  az vm create \
    --resource-group MyResourceGroup \
    --name MyVM \
    --image UbuntuLTS \
    --admin-username azureuser \
    --generate-ssh-keys
  ```

- **Open a Port on a VM**:

  ```bash
  az vm open-port --port 80 --resource-group MyResourceGroup --name MyVM
  ```

- **List VMs**:

  ```bash
  az vm list --output table
  ```

- **Delete a VM**:

  ```bash
  az vm delete --resource-group MyResourceGroup --name MyVM --yes
  ```

### Storage Account

- **Create a Storage Account**:

  ```bash
  az storage account create \
    --name mystorageaccount \
    --resource-group MyResourceGroup \
    --location eastus \
    --sku Standard_LRS
  ```

- **List Storage Accounts**:

  ```bash
  az storage account list --output table
  ```

- **Delete a Storage Account**:

  ```bash
  az storage account delete --name mystorageaccount --resource-group MyResourceGroup --yes
  ```

## Conclusion

The Azure CLI is a versatile tool that simplifies the management of Azure resources. By mastering the basic commands and setup, you can efficiently manage your Azure environment from the command line.

For more detailed information and advanced usage, refer to the [official Azure CLI documentation](https://learn.microsoft.com/en-us/cli/azure/).
