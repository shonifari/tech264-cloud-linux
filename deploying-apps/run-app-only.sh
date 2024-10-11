#!/bin/bash

REPO="tech264-sparta-app"

# Set DB_HOST variable 
export DB_HOST="mongodb://10.0.3.4:27017/posts"

cd /$REPO/app/

node ./seeds/seeds.js

pm2 stop all

pm2 start app.js