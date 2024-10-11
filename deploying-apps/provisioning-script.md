
# Provisioning Script Documentation

This script installs Nginx, Node.js, PM2, and the Sparta app. It was created on 10/10/2024.

## Script Overview

The script performs the following tasks:

1. Updates the Linux source list.
2. Upgrades available Linux packages.
3. Installs Nginx and configures it as a reverse proxy.
4. Installs Node.js version 20.
5. Clones the Sparta app repository from GitHub.
6. Sets the `DB_HOST` environment variable.
7. Installs necessary npm packages for the Sparta app.
8. Fixes npm package vulnerabilities.
9. Installs PM2 to manage the Node.js application.
10. Starts the Sparta app using PM2.

## Script Details

```bash
#!/bin/bash

# Script installs nginx, node js, pm2 and sparta app.
# Created on: 10/10/2024

GH_REPO="https://github.com/shonifari/tech264-sparta-app.git"
REPO="tech264-sparta-app"
MONGODB_HOST="mongodb://10.0.3.4:27017"

# Update Linux source list
echo update sources list...
sudo apt-get update -y
echo Done!

# Upgrade Linux packages
echo upgrade any packages available...
sudo DEBIAN_FRONTEND=noninteractive apt-get upgrade -y
echo Done!

# Installing Nginx
echo install nginx...
sudo DEBIAN_FRONTEND=noninteractive apt-get install nginx -y
echo Done!

# Use sed to update the proxy settings in the configuration file
echo Enabling reverse proxy..
sudo sed -i 's|try_files $uri $uri/ =404;|proxy_pass http://localhost:3000;|' /etc/nginx/sites-available/default
echo Done!

# Check syntax error
sudo nginx -t

# Restart Nginx
echo Restarting Nginx...
sudo systemctl restart nginx
echo "Nginx restarted."

# Installing Node JS
echo install nodejs v20...
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash - &&\
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y nodejs
echo Done!

# Check Node version
echo check nodejs version...
node -v
echo Done!

echo Download sparta app...
if git clone $GH_REPO $REPO; then
    echo Done!
else
    echo "Failed to clone repository"
fi

# Set DB_HOST variable 
echo "Connect via our VMs via IP."
export DB_HOST=$MONGODB_HOST
echo "Connection complete."
echo "Set env variable"
printenv DB_HOST
echo "env variable set."

# Installing packages
echo Install package...
if cd $REPO/app; then
    npm install
    echo Done!
else
    echo "Directory $REPO/app does not exist"
    exit 1
fi

# Fix major vulnerability
echo Fixing npm packages..
npm audit fix
echo Done!

# Installing PM2 to manage 
echo installing PM2
sudo npm install -g pm2
echo Done!

pm2 stop all

# Run the app
echo Run app...
pm2 start app.js
echo Done!
```

## Usage

1. **Update and Upgrade**: The script updates the source list and upgrades any available packages.
2. **Install Nginx**: Installs Nginx and configures it to act as a reverse proxy.
3. **Install Node.js**: Installs Node.js version 20.
4. **Clone Sparta App**: Clones the Sparta app repository from GitHub.
5. **Set Environment Variable**: Sets the `DB_HOST` environment variable to connect to the MongoDB instance.
6. **Install NPM Packages**: Installs the necessary npm packages for the Sparta app.
7. **Fix Vulnerabilities**: Runs `npm audit fix` to fix any vulnerabilities.
8. **Install PM2**: Installs PM2 globally to manage the Node.js application.
9. **Run the App**: Uses PM2 to start the Sparta app.

## Notes

- Ensure you have the necessary permissions to run the script.
- Modify the `MONGODB_HOST` variable if your MongoDB instance is hosted elsewhere.
- The script assumes the default Nginx configuration file is located at `/etc/nginx/sites-available/default`.
