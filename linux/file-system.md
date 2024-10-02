# Linux File System

- [Linux File System](#linux-file-system)
  - [Summary](#summary)
    - [Key Components of the Linux File System](#key-components-of-the-linux-file-system)
    - [Types of Linux File Systems](#types-of-linux-file-systems)
  - [Linux File Ownership](#linux-file-ownership)
    - [Why is Managing File Ownership Important?](#why-is-managing-file-ownership-important)
    - [What is the Command to View File Ownership?](#what-is-the-command-to-view-file-ownership)
    - [What Permissions are Set When a User Creates a File or Directory? Who Does the File or Directory Belong To?](#what-permissions-are-set-when-a-user-creates-a-file-or-directory-who-does-the-file-or-directory-belong-to)
    - [Why Does the Owner, by Default, Not Receive Execute Permissions When They Create a File?](#why-does-the-owner-by-default-not-receive-execute-permissions-when-they-create-a-file)
    - [What Command is Used to Change the Owner of a File or Directory?](#what-command-is-used-to-change-the-owner-of-a-file-or-directory)
  - [Linux File Permissions](#linux-file-permissions)
    - [Does Being the Owner of a File Mean You Have Full Permissions on That File? Explain.](#does-being-the-owner-of-a-file-mean-you-have-full-permissions-on-that-file-explain)
    - [If You Give Permissions to the User Entity, What Does This Mean?](#if-you-give-permissions-to-the-user-entity-what-does-this-mean)
    - [If You Give Permissions to the Group Entity, What Does This Mean?](#if-you-give-permissions-to-the-group-entity-what-does-this-mean)
    - [If You Give Permissions to the Other Entity, What Does This Mean?](#if-you-give-permissions-to-the-other-entity-what-does-this-mean)
    - [Permissions Scenario](#permissions-scenario)
      - [Given Permissions](#given-permissions)
      - [Your Permissions as the Owner](#your-permissions-as-the-owner)
    - [Analyzing `ls -l` Output](#analyzing-ls--l-output)
      - [Example Line](#example-line)
      - [Breakdown](#breakdown)
  - [Linux Numeric File Permissions](#linux-numeric-file-permissions)
    - [What Numeric Values are Assigned to Each Permission?](#what-numeric-values-are-assigned-to-each-permission)
    - [What Can You Do with the Values to Assign Read + Write Permissions?](#what-can-you-do-with-the-values-to-assign-read--write-permissions)
    - [What Value Would Assign Read, Write, and Execute Permissions?](#what-value-would-assign-read-write-and-execute-permissions)
    - [What Value Would Assign Read and Execute Permissions?](#what-value-would-assign-read-and-execute-permissions)
    - [What Does 644 Mean in Terms of File Permissions?](#what-does-644-mean-in-terms-of-file-permissions)
  - [Changing File Permissions](#changing-file-permissions)
    - [What Command Changes File Permissions?](#what-command-changes-file-permissions)
    - [To Change Permissions on a File, What Must the End User Be? (2 Answers)](#to-change-permissions-on-a-file-what-must-the-end-user-be-2-answers)
    - [Examples of Different Ways/Syntaxes to Set Permissions on a New File (named `testfile.txt`)](#examples-of-different-wayssyntaxes-to-set-permissions-on-a-new-file-named-testfiletxt)
      - [Set User to Read, Group to Read + Write + Execute, and Other to Read and Write Only](#set-user-to-read-group-to-read--write--execute-and-other-to-read-and-write-only)
      - [Add Execute Permissions (to All Entities)](#add-execute-permissions-to-all-entities)
      - [Take Write Permissions Away from Group](#take-write-permissions-away-from-group)
      - [Use Numeric Values to Give Read + Write Access to User, Read Access to Group, and No Access to Other](#use-numeric-values-to-give-read--write-access-to-user-read-access-to-group-and-no-access-to-other)

## Summary

The Linux file system is a method used by the Linux operating system to organize and store files and data. It is structured in a hierarchical, tree-like format, starting from the root directory (`/`) and branching out into various subdirectories.

### Key Components of the Linux File System

1. **Root Directory (`/`)**:
   - The top-level directory in the Linux file system. All other directories and files are contained within this directory.

2. **Home Directory (`/home`)**:
   - Contains personal directories for each user. For example, a user named "adminuser" would have a directory at `/home/adminuser`.

3. **Bin Directory (`/bin`)**:
   - Stores essential binary executables needed for system booting and single-user mode. Common commands like `ls`, `cp`, and `mv` are found here.

4. **Etc Directory (`/etc`)**:
   - Contains system-wide configuration files and shell scripts used to boot and initialize system settings.

5. **Var Directory (`/var`)**:
   - Holds variable data files like logs, databases, and email. For example, system logs are typically stored in `/var/log`.

6. **Usr Directory (`/usr`)**:
   - Contains user utilities and applications. It is often the largest directory and includes subdirectories like `/usr/bin` for user binaries and `/usr/lib` for libraries.

7. **Tmp Directory (`/tmp`)**:
   - Used for temporary files created by system processes and users. Files here are usually deleted upon system reboot.

### Types of Linux File Systems

- **Ext4**: The most commonly used file system in Linux, known for its stability and performance.
- **XFS**: A high-performance file system suitable for large files and high-capacity storage.
- **Btrfs**: Designed for advanced features like snapshotting and dynamic resizing.

## Linux File Ownership

### Why is Managing File Ownership Important?

Managing file ownership is crucial for several reasons:

- **Security**: It helps protect sensitive data by ensuring only authorized users can access or modify files.
- **Access Control**: It allows administrators to define which users or groups can read, write, or execute specific files and directories.
- **System Integrity**: Proper ownership settings prevent unauthorized changes that could compromise system stability and security¹.

### What is the Command to View File Ownership?

To view file ownership, you can use the `ls -l` command. This command lists files and directories along with their ownership and permissions.

```bash
ls -l
```

### What Permissions are Set When a User Creates a File or Directory? Who Does the File or Directory Belong To?

When a user creates a file or directory, the default permissions are determined by the `umask` value. Typically, the default permissions are:

- **Files**: `rw-r--r--` (644) - Read and write for the owner, read-only for the group and others.
- **Directories**: `rwxr-xr-x` (755) - Read, write, and execute for the owner, read and execute for the group and others.

The file or directory belongs to the user who created it and the user's primary group.

### Why Does the Owner, by Default, Not Receive Execute Permissions When They Create a File?

By default, the owner does not receive execute permissions for newly created files because most files are not executable. This default setting helps prevent accidental execution of non-executable files, which could lead to security risks or system errors.

### What Command is Used to Change the Owner of a File or Directory?

[To change the owner](commands.md#changing-file-permission) of a file or directory, you can use the `chown` command. The syntax is:

```bash
chown <new_owner> <file_or_directory>
```

Sure! Here's a well-formatted Markdown document answering your questions about Linux file ownership and permissions:

---

## Linux File Permissions

### Does Being the Owner of a File Mean You Have Full Permissions on That File? Explain.

No, being the owner of a file does not automatically mean you have full permissions on that file. The permissions for the owner are explicitly set and can vary. For example, the owner might have read and write permissions but not execute permissions. The permissions are defined by the file's mode, which includes settings for the owner, group, and others¹.

### If You Give Permissions to the User Entity, What Does This Mean?

Giving permissions to the User entity means assigning specific access rights to the owner of the file. These permissions can include:

- **Read (r)**: The owner can view the contents of the file.
- **Write (w)**: The owner can modify the contents of the file.
- **Execute (x)**: The owner can execute the file if it is a script or a binary².

### If You Give Permissions to the Group Entity, What Does This Mean?

Giving permissions to the Group entity means assigning specific access rights to all users who are members of the file's group. These permissions can include:

- **Read (r)**: Group members can view the contents of the file.
- **Write (w)**: Group members can modify the contents of the file.
- **Execute (x)**: Group members can execute the file if it is a script or a binary².

### If You Give Permissions to the Other Entity, What Does This Mean?

Giving permissions to the Other entity means assigning specific access rights to all users who are not the owner or part of the group. These permissions can include:

- **Read (r)**: Others can view the contents of the file.
- **Write (w)**: Others can modify the contents of the file.
- **Execute (x)**: Others can execute the file if it is a script or a binary².

### Permissions Scenario

#### Given Permissions

- **User (Owner)**: Read-only
- **Group**: Read and write
- **Others**: Read, write, and execute

#### Your Permissions as the Owner

Since you are logged in as the user who owns the file, you will have **read-only** permissions. Despite the group and others having more extensive permissions, the owner's permissions are strictly read-only in this scenario.

### Analyzing `ls -l` Output

#### Example Line

```bash
-rwxr-xr-- 1 tcboony staff  123 Nov 25 18:36 keeprunning.sh
```

#### Breakdown

- **`-rwxr-xr--`**: File type and permissions
  - `-`: Regular file
  - `rwx`: Owner (tcboony) has read, write, and execute permissions
  - `r-x`: Group (staff) has read and execute permissions
  - `r--`: Others have read-only permissions
- **`1`**: Number of hard links
- **`tcboony`**: Owner of the file
- **`staff`**: Group associated with the file
- **`123`**: File size in bytes
- **`Nov 25 18:36`**: Last modification date and time
- **`keeprunning.sh`**: File name

## Linux Numeric File Permissions

### What Numeric Values are Assigned to Each Permission?

In Linux, each permission type is assigned a numeric value:

- **Read (r)**: 4
- **Write (w)**: 2
- **Execute (x)**: 1

These values can be combined to set multiple permissions.

### What Can You Do with the Values to Assign Read + Write Permissions?

To assign read and write permissions, you add the numeric values for read (4) and write (2):

```plaintext
4 (read) + 2 (write) = 6
```

So, the numeric value for read and write permissions is **6**.

### What Value Would Assign Read, Write, and Execute Permissions?

To assign read, write, and execute permissions, you add the numeric values for read (4), write (2), and execute (1):

```plaintext
4 (read) + 2 (write) + 1 (execute) = 7
```

So, the numeric value for read, write, and execute permissions is **7**.

### What Value Would Assign Read and Execute Permissions?

To assign read and execute permissions, you add the numeric values for read (4) and execute (1):

```plaintext
4 (read) + 1 (execute) = 5
```

So, the numeric value for read and execute permissions is **5**.

### What Does 644 Mean in Terms of File Permissions?

When a file or directory's mode/permissions are represented by three numbers, each digit represents the permissions for the owner, group, and others, respectively.

For **644**:

- **Owner (6)**: Read and write (4 + 2)
- **Group (4)**: Read only
- **Others (4)**: Read only

So, a file with permissions set to 644 means the owner can read and write the file, while the group and others can only read the file.

Sure! Here's a well-formatted Markdown document answering your questions about Linux file permissions:

## Changing File Permissions

### What Command Changes File Permissions?

The command used to change file permissions in Linux is `chmod` (change mode).

```bash
chmod <options> mode file
```

### To Change Permissions on a File, What Must the End User Be? (2 Answers)

To change permissions on a file, the end user must be:

1. The **owner** of the file.
2. A **superuser** (root).

### Examples of Different Ways/Syntaxes to Set Permissions on a New File (named `testfile.txt`)

#### Set User to Read, Group to Read + Write + Execute, and Other to Read and Write Only

Using symbolic notation:

```bash
chmod u=r,g=rwx,o=rw testfile.txt
```

Using numeric notation:

```bash
chmod 764 testfile.txt
```

#### Add Execute Permissions (to All Entities)

Using symbolic notation:

```bash
chmod +x testfile.txt
```

Using numeric notation (assuming current permissions are 644):

```bash
chmod 755 testfile.txt
```

#### Take Write Permissions Away from Group

Using symbolic notation:

```bash
chmod g-w testfile.txt
```

Using numeric notation (assuming current permissions are 764):

```bash
chmod 754 testfile.txt
```

#### Use Numeric Values to Give Read + Write Access to User, Read Access to Group, and No Access to Other

Using numeric notation:

```bash
chmod 640 testfile.txt
```
