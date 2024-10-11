#!/bin/bash

# Scripts intalls nginx, node js, pm2 and sparta app.
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

# Intstalling PM2 to manage 
echo intalling PM2
sudo npm install -g pm2
echo Done!\n

pm2 stop all

# Run the app
echo Run app...
pm2 start app.js
echo Done!
