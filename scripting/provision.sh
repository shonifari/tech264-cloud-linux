#!/bin/bash`
# updates packages
sudo apt update -y
# upgrades packages
sudo apt upgrade -y
# install nginx - webserver
sudo apt install nginx -y
# restart nginx
sudo systemctl restart nginx
# enable nginx - going to automatically start when VM starts
sudo systemctl enable nginx

