#!/bin/bash
CONFIGURATION_FILE="proxy.conf"
PUBLIC_IP=123

# Update the system package list
echo Updating package list...
sudo apt-get update -y
echo Done!
 
# Upgrade all installed packages to their latest versions
echo Upgrading installed packages...
sudo DEBIAN_FRONTEND=noninteractive apt-get upgrade -y
echo Done!

# Install Nginx
echo install nginx...
sudo DEBIAN_FRONTEND=noninteractive apt-get install nginx -y
echo Done!


# Create nginx configuration file
echo Creating nginx configuration file...
echo "server {
    listen 80;

    server_name $PUBLIC_IP;

    location / {
        proxy_pass http://localhost:3000;  # Replace with your backend server address
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
    }
}
" > /etc/nginx/sites-available/$CONFIGURATION_FILE
echo Nginx Configuration file created succsessfully!

# Enable file
sudo ln -s /etc/nginx/sites-available/$CONFIGURATION_FILE /etc/nginx/sites-enabled/

# Check syntax error
sudo nginx -t

# Restart NGinx
sudo systemctl restart nginx
