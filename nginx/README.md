# How to Write a Bash Script: provision nginx

1. use `nano provision.sh` to begin creating your `provision.sh` file, which will host the script.
2. In the nano interface, write the following lines (be sure to write comments using `#` to help with understanding):
   1. `#!/bin/bash`, which i called "**shebang**". This specifies which interpreter should be used to execute the script - so this tells it to use the **Bash** script.
   2. `sudo apt update -y`
   3. `sudo apt upgrade -y`
   4. `sudo apt install -y nginx`
   5. `sudo systemctl restart nginx`
   6. `sudo systemctl enable nginx`
3. Save the script by clicking `CTRL+S`, then exit the script by clicking `CTRL+X` to return back to your regular linux CL.
4. Since the default **permissions** do not allow you to execute the script, use `chmod +x provision.sh` to add **execution** **permissions** to the file.
5. Run the script using `./provision.sh`.

Sure! Here's an explanation of your script along with documentation in Markdown style:

---

## Script to Update System, Install Nginx, and Configure Nginx

This script performs the following tasks:

1. Updates the system package list.
2. Upgrades all installed packages to their latest versions.
3. Installs Nginx.
4. Creates an Nginx configuration file.
5. Enables the new configuration.
6. Checks for syntax errors in the Nginx configuration.
7. Restarts the Nginx service.

### Script Explanation

```bash
# Update the system package list
echo Updating package list...
sudo apt-get update -y
echo Done!
```

- **Description**: Updates the list of available packages and their versions.
- **Command**: `sudo apt-get update -y`
- **Output**: Prints "Updating package list..." and "Done!" after completion.

```bash
# Upgrade all installed packages to their latest versions
echo Upgrading installed packages...
sudo DEBIAN_FRONTEND=noninteractive apt-get upgrade -y
echo Done!
```

- **Description**: Upgrades all installed packages to their latest versions without prompting for user input.
- **Command**: `sudo DEBIAN_FRONTEND=noninteractive apt-get upgrade -y`
- **Output**: Prints "Upgrading installed packages..." and "Done!" after completion.

```bash
# Install Nginx
echo install nginx...
sudo DEBIAN_FRONTEND=noninteractive apt-get install nginx -y
echo Done!
```

- **Description**: Installs the Nginx web server.
- **Command**: `sudo DEBIAN_FRONTEND=noninteractive apt-get install nginx -y`
- **Output**: Prints "install nginx..." and "Done!" after completion.

```bash
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
echo Nginx Configuration file created successfully!
```

- **Description**: Creates a new Nginx configuration file with the specified server settings.
- **Commands**:
  - `echo "server { ... }" > /etc/nginx/sites-available/$CONFIGURATION_FILE`: Writes the configuration to a file.
- **Output**: Prints "Creating nginx configuration file..." and "Nginx Configuration file created successfully!" after completion.

```bash
# Enable file
sudo ln -s /etc/nginx/sites-available/$CONFIGURATION_FILE /etc/nginx/sites-enabled/
```

- **Description**: Creates a symbolic link to enable the new Nginx configuration.
- **Command**: `sudo ln -s /etc/nginx/sites-available/$CONFIGURATION_FILE /etc/nginx/sites-enabled/`
- **Output**: None.

```bash
# Check syntax error
sudo nginx -t
```

- **Description**: Checks the Nginx configuration file for syntax errors.
- **Command**: `sudo nginx -t`
- **Output**: Prints the result of the syntax check.

```bash
# Restart Nginx
sudo systemctl restart nginx
```

- **Description**: Restarts the Nginx service to apply the new configuration.
- **Command**: `sudo systemctl restart nginx`
- **Output**: None.

---

This script automates the process of updating the system, installing Nginx, configuring it, and ensuring the new configuration is applied correctly. If you have any questions or need further customization, feel free to ask!