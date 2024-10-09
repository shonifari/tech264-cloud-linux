# How to deploy and webapp to Azure VM

- [How to deploy and webapp to Azure VM](#how-to-deploy-and-webapp-to-azure-vm)
  - [Preparing the VM environment](#preparing-the-vm-environment)
  - [Moving app through SCP](#moving-app-through-scp)
  - [m](#m)

## Preparing the VM environment

We need to provision our VM

## Moving app through SCP

We can copy folders into our VM using the scp (Secure Copy Protocol)

```bash
scp -i ~/.ssh/<private_ssh_key> -r <source_path> <user>@<vm_public_ip>:<destination_path>

```

## m

We can copy folders into our VM using the scp (Secure Copy Protocol)

```bash

sudo apt-get install gnupg curl 

curl -fsSL https://www.mongodb.org/static/pgp/server-7.0.asc | \
   sudo gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg \
   --dearmor

echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list
 
sudo apt-get update -y
 
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y mongodb-org=7.0.6 mongodb-org-database=7.0.6 mongodb-org-server=7.0.6 mongodb-mongosh=2.1.5 mongodb-org-mongos=7.0.6 mongodb-org-tools=7.0.6

sudo systemctl start mongod

# Change configuration
sudo nano /etc/mongod.conf

#
sudo systemctl restart mongod
sudo systemctl is-enabled mongod
sudo systemctl enable mongod
```

```bash

# mongod.conf

# for documentation of all options, see:
#   http://docs.mongodb.org/manual/reference/configuration-options/

# Where and how to store data.
storage:
  dbPath: /var/lib/mongodb
#  engine:
#  wiredTiger:

# where to write logging data.
systemLog:
  destination: file
  logAppend: true
  path: /var/log/mongodb/mongod.log

# network interfaces
net:
  port: 27017
  bindIp: 127.0.0.1 # CHANGE TO 0.0.0.0


# how the process runs
processManagement:
  timeZoneInfo: /usr/share/zoneinfo

#security:

#operationProfiling:

#replication:

#sharding:

## Enterprise-Only Options:

#auditLog:

```

```bash
export DB_HOST=mongodb://10.0.3.4:27017/posts
```
