# Azure Blob Storage

```bash
az storage account create --name tech264karisstorage --resource-group tech264 --location uksouth --sku Standard_LRS
```

## Show storage account lists

* List all account and details

```bash
az storage account list --resource-group tech264
```

* As table format
  
```bash
az storage account list --resource-group tech264 --query "[].{Name:name, Location:location, Kind:kind}" --output table
```

## Create a container

```bash
az storage container create \
    --account-name tech264karisstorage \
    --name testcontainer \
    --auth-mode login
```

## List container

* As table format
  
```bash
az storage container list \
--account-name tech264karisstorage \
--output table \
--auth-mode login
```

## Blob Upload

```bash
az storage blob upload \
    --account-name tech264karisstorage \
    --container-name images \
    --name dowwloadedcat.jpg \
    --file cat.jpg \
    --auth-mode login
```

## List Blob

```bash
az storage blob list \
    --account-name tech264karisstorage \
    --container-name testcontainer \
    --output table \
    --auth-mode login
```

