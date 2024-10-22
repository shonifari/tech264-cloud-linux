
# Azure Blob Storage

- [Azure Blob Storage](#azure-blob-storage)
  - [What is a Blob Storage](#what-is-a-blob-storage)
  - [Creating a Storage Account](#creating-a-storage-account)
  - [Show Storage Account Lists](#show-storage-account-lists)
    - [List all accounts and details](#list-all-accounts-and-details)
    - [List as table format](#list-as-table-format)
  - [Create a Container](#create-a-container)
  - [List Containers](#list-containers)
    - [List as table format](#list-as-table-format-1)
  - [Blob Upload](#blob-upload)
  - [List Blobs](#list-blobs)
  - [Additional Features](#additional-features)
    - [Access Tiers](#access-tiers)
    - [Blob Types](#blob-types)
    - [Security](#security)
    - [Monitoring and Logging](#monitoring-and-logging)
  - [Conclusion](#conclusion)

## What is a Blob Storage

Azure Blob Storage is Microsoft's object storage solution for the cloud. It is optimized for storing massive amounts of unstructured data, such as text or binary data. Blob Storage is ideal for serving images or documents directly to a browser, storing files for distributed access, streaming video and audio, writing to log files, and storing data for backup and restore, disaster recovery, and archiving.

## Creating a Storage Account

To use Azure Blob Storage, you first need to create a storage account. Here’s how you can do it using the Azure CLI:

```bash
az storage account create --name tech264karisstorage --resource-group tech264 --location uksouth --sku Standard_LRS
```

## Show Storage Account Lists

You can list all storage accounts and their details within a resource group:

### List all accounts and details

```bash
az storage account list --resource-group tech264
```

### List as table format

```bash
az storage account list --resource-group tech264 --query "[].{Name:name, Location:location, Kind:kind}" --output table
```

## Create a Container

A container organizes a set of blobs, similar to a directory in a file system. Here’s how to create a container:

```bash
az storage container create \
    --account-name tech264karisstorage \
    --name testcontainer \
    --auth-mode login
```

## List Containers

You can list all containers within a storage account:

### List as table format

```bash
az storage container list \
    --account-name tech264karisstorage \
    --output table \
    --auth-mode login
```

## Blob Upload

Blobs are the files you store in Azure Blob Storage. Here’s how to upload a blob:

```bash
az storage blob upload \
    --account-name tech264karisstorage \
    --container-name images \
    --name downloadedcat.jpg \
    --file cat.jpg \
    --auth-mode login
```

## List Blobs

You can list all blobs within a container:

```bash
az storage blob list \
    --account-name tech264karisstorage \
    --container-name testcontainer \
    --output table \
    --auth-mode login
```

## Additional Features

### Access Tiers

Azure Blob Storage offers different access tiers to optimize costs based on how frequently data is accessed:

- **Hot**: For data that is accessed frequently.
- **Cool**: For data that is infrequently accessed and stored for at least 30 days.
- **Archive**: For data that is rarely accessed and stored for at least 180 days with flexible latency requirements.

### Blob Types

Azure Blob Storage supports three types of blobs:

- **Block Blobs**: For storing text and binary data. Ideal for files that are uploaded and downloaded in chunks.
- **Append Blobs**: Optimized for append operations. Ideal for logging.
- **Page Blobs**: For random read/write operations. Used for virtual hard disk (VHD) files.

### Security

Azure Blob Storage provides several security features:

- **Encryption**: Data is encrypted at rest and in transit.
- **Access Control**: Use Azure Active Directory (AAD) and Role-Based Access Control (RBAC) to manage access.
- **Shared Access Signatures (SAS)**: Provide limited access to your storage account resources without exposing your account key.

### Monitoring and Logging

Azure provides tools to monitor and log activities in your Blob Storage:

- **Azure Monitor**: For monitoring performance and usage metrics.
- **Azure Storage Analytics**: For logging and providing metrics data for a storage account.

## Conclusion

Azure Blob Storage is a versatile and scalable solution for storing unstructured data in the cloud. By leveraging its features, you can efficiently manage and secure your data while optimizing costs.

For more detailed information and advanced usage, refer to the [official Azure Blob Storage documentation](https://learn.microsoft.com/en-us/azure/storage/blobs/)¹.

¹: [Azure Blob Storage documentation](https://learn.microsoft.com/en-us/azure/storage/blobs/)

---
