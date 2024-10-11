#!/bin/bash


# Update the system package list
echo "Updating package list..."
sudo apt-get update -y
echo "Done!"

# Upgrade all installed packages to their latest versions
echo "Upgrading installed packages..."
sudo DEBIAN_FRONTEND=noninteractive apt-get upgrade -y
echo "Done!"

# Install Nginx
echo "Installing Nginx..."
sudo DEBIAN_FRONTEND=noninteractive apt-get install nginx -y
echo "Done!"

# Backup the default Nginx configuration file
sudo cp /etc/nginx/sites-available/default /etc/nginx/sites-available/default.bak

# Use sed to update the proxy settings in the configuration file
sudo sed -i 's|try_files $uri $uri/ =404;|proxy_pass http://localhost:3000;|' /etc/nginx/sites-available/default

# Check syntax error
sudo nginx -t

# Restart Nginx
sudo systemctl restart nginx
echo "Nginx restarted."
