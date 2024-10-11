# Load testing

```sh
ab -n 1000 -c 100 http://172.167.154.88.com/
```

#  
1. Connect the `VM with SSH key`
2. To see the `repo/app`- need to be in root directory  -> `cd /repo/app`
3. Stop all processes -> `pm2 stop all`
4. To start the app -> `sudo pm2 start app.js`
# How to increase CPU
```bash
sudo apt-get install apache2-utils
```
```bash
ab
```
# Load testing with Apache Bench
 
```bash
ab -n 1000 -c 100 http://yourwebsite.com/
 
# ab -n 1000 -c 100 http://public ip address/
# to increase the requests : ab -n 1000 -c 200...
```