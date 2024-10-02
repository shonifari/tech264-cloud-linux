# Linux Commands

- [Linux Commands](#linux-commands)
  - [Commands](#commands)
    - [List the Contents of a Folder](#list-the-contents-of-a-folder)
    - [Navigate the File System](#navigate-the-file-system)
    - [Print the Current Working Directory](#print-the-current-working-directory)
    - [Create a File](#create-a-file)
    - [Display the Contents of a File](#display-the-contents-of-a-file)
    - [Move or Rename Files/Directories](#move-or-rename-filesdirectories)
    - [Copy Files or Directories](#copy-files-or-directories)
    - [Remove Files or Directories](#remove-files-or-directories)
    - [Show informations about the system](#show-informations-about-the-system)
    - [Show user information](#show-user-information)
    - [Command history](#command-history)
    - [Download data](#download-data)
    - [Check the file type](#check-the-file-type)
    - [Find text in a file](#find-text-in-a-file)
    - [Super user priviliges](#super-user-priviliges)
    - [Installing packages](#installing-packages)
    - [Update packages](#update-packages)
    - [Upgrade packages](#upgrade-packages)
    - [Switch to super user](#switch-to-super-user)
    - [Changing file permission](#changing-file-permission)

## Commands

### List the Contents of a Folder

To list the contents of a folder, use the `ls` command.

- **Default:**

    ```bash
    ls

    # OUTPUT:
    # folder file1 file2 file3 folder2
    ```

- **Including Hidden Files:**

    ```bash
    ls -a

    # OUTPUT:
    # .hidden_folder .hidden_file folder file1 file2 file3 folder2
    ```

- **Show more information:**

    ```bash
    ls -l

    # OUTPUT:
    # total 36
    # drwxr-xr-x 5 adminuser adminuser 4096 Oct  2 13:10 .
    # drwxr-xr-x 3 root      root      4096 Oct  2 11:33 ..
    # -rw------- 1 adminuser adminuser   43 Oct  2 13:10 .bash_history
    # -rw-r--r-- 1 adminuser adminuser  220 Apr  4  2018 .bash_logout
    # -rw-r--r-- 1 adminuser adminuser 3771 Apr  4  2018 .bashrc
    # drwx------ 2 adminuser adminuser 4096 Oct  2 13:03 .cache
    # drwx------ 3 adminuser adminuser 4096 Oct  2 13:03 .gnupg
    # -rw-r--r-- 1 adminuser adminuser  807 Apr  4  2018 .profile
    # drwx------ 2 adminuser adminuser 4096 Oct  2 11:33 .ssh

    ```

### Navigate the File System

To navigate through directories, use the `cd` command.

- **Navigate to a Specific Folder:**

    ```bash
    cd <folder_path>
    ```

- **Go to the Parent Folder:**

    ```bash
    cd ..
    ```

### Print the Current Working Directory

To print the current directory you're working in, use the `pwd` command.

```bash
pwd
```

### Create a File

To create an empty file, use the `touch` command.

```bash
touch <file_name>
```

### Display the Contents of a File

To display the contents of a file, use the `cat` command.

```bash
cat <file_path>
```

```bash
head -2 <file_path>
# OUTPUT
# first 2 lines of a file
```

```bash
tail -2 <file_path>
# OUTPUT
# last 2 lines of a file
```

```bash
nl <file_path>
# OUTPUT
# last 2 lines of a file
```

### Move or Rename Files/Directories

To move or rename files or directories, use the `mv` command.

```bash
mv <source_path> <destination_path>
```

### Copy Files or Directories

To copy files or directories, use the `cp` command.

```bash
cp <source_path> <destination_path>
```

### Remove Files or Directories

To remove files, use the `rm` command.

```bash
rm <file_path>
```

- **Remove a Directory:**

    To remove a directory and its contents recursively, use the `-r` option.

    ```bash
    rm -r <directory_path>
    ```

### Show informations about the system

To remove files, use the `uname` command.

```bash
uname
# Linux
```

- **Show all info:**

    To remove a directory and its contents recursively, use the `-r` option.

    ```bash
    uname -a
    # Linux tech264-karis-first-vm 5.4.0-1138-azure #145~18.04.1-Ubuntu SMP Fri Aug 30 16:36:55 UTC 2024 x86_64 x86_64 x86_64 GNU/Linux
    ```

### Show user information

To show user information, use the `whoami` command.

```bash
whoami
# adminuser
```

### Command history

To remove files, use the `history` command.

```bash
history
# list of commands
# 1 command
# 2 command
```

- **Clear history**
  
    ```bash
    history -c
    # list of commands
    # 1 command
    # 2 command
    ```

- **Run a command from history**
  
    ```bash
    !<command_number>
    ```

### Download data

To remove files, use the `curl` or `wget` command.

```bash
curl <url> --output <file_path>
# OUTPUT:
#  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
#                                 Dload  Upload   Total   Spent    Left  Speed
#100 71944  100 71944    0     0  2129k      0 --:--:-- --:--:-- --:--:-- 2129k

```

```bash
wget <url> -o <file_path>
```

### Check the file type

To remove files, use the `file` command.

```bash
file <file_path>
# OUTPUT:
# cat.jpg: JPEG image data, baseline, precision 8, 930x620, frames 3
```

### Find text in a file

To search, use the `grep` command.

```bash
cat <file_path> | grep chicken
# OUTPUT:
# Why did the **chicken** cross the road?
```

### Super user priviliges

To get super user priviliges, use the `sudo` command.

```bash
sudo 
```

### Installing packages

To install, use the `apt install` command.

```bash
sudo apt install <package>
# OUTPUT:
# Why did the **chicken** cross the road?
```

### Update packages

To update, use the `apt update` command.

```bash
sudo apt update -y
# OUTPUT:
# ....
```

### Upgrade packages

To upgrade, use the `apt upgrade` command.
This could break the system.

```bash
sudo apt upgrade -y
# OUTPUT:
# ....
```

### Switch to super user

To upgrade, use the `apt upgrade` command.
This could break the system.

```bash
sudo su
# OUTPUT:
# ....
```

To return as non root user

```bash
exit
# OUTPUT:
# ....
```

### Changing file permission

To change the owner of a file or directory, you can use the `chown` command. The syntax is:

```bash
chown <new_owner> <file_or_directory>
```
