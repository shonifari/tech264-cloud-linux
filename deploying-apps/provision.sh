#!/bin/bash
GH_REPO="https://github.com/shonifari/tech264-sparta-app.git"
REPO="tech264-sparta-app"
MONGODB__HOST="mongodb://10.0.3.4:27017"

echo "Connect via our VMs via IP."
export DB_HOST=$MONGODB__HOST
echo "Connection complete."
echo "Set env variable"
printenv DB_HOST
echo "env variable set."

echo update sources list...
sudo apt-get update -y
echo Done!

echo upgrade any packages available...
sudo DEBIAN_FRONTEND=noninteractive apt-get upgrade -y
echo Done!

echo install nginx...
sudo DEBIAN_FRONTEND=noninteractive apt-get install nginx -y
echo Done!

echo install nodejs v20...
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash - &&\
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y nodejs
echo Done!

echo check nodejs version...
node -v
echo Done!

echo Download sparta app...
if git clone $GH_REPO $REPO; then
    echo Done!
else
    echo "Failed to clone repository"
fi

echo Install package...
if cd $REPO/app; then
    npm install
    echo Done!
else
    echo "Directory $REPO/app does not exist"
    exit 1
fi

echo Fixing npm packages..
npm audit fix
echo Done!

echo "Connect via our VMs via IP."
export DB_HOST=$MONGODB__HOST
echo "Connection complete."
echo "Set env variable"
printenv DB_HOST
echo "env variable set."
 
echo "NPM install and start"
npm install
echo "Start complete."

echo Run app...
npm start &
echo Done!
