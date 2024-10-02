# Linux Documentation

## Table of Contents

- [Linux Documentation](#linux-documentation)
  - [Table of Contents](#table-of-contents)
  - [What is Linux?](#what-is-linux)
  - [Linux Commands](#linux-commands)
    - [List the Contents of a Folder](#list-the-contents-of-a-folder)
    - [Navigate the File System](#navigate-the-file-system)
    - [Print the Current Working Directory](#print-the-current-working-directory)
    - [Create a File](#create-a-file)
    - [Display the Contents of a File](#display-the-contents-of-a-file)
    - [Move or Rename Files/Directories](#move-or-rename-filesdirectories)
    - [Copy Files or Directories](#copy-files-or-directories)
    - [Remove Files or Directories](#remove-files-or-directories)

## What is Linux?

Linux is a family of open-source Unix-like operating systems based on the Linux kernel. It is used on servers, desktops, mobile devices, and embedded systems.

## Linux Commands

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
