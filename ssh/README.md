# SSH Documentation

## Table of Contents

- [SSH Documentation](#ssh-documentation)
  - [Table of Contents](#table-of-contents)
  - [What is SSH?](#what-is-ssh)
  - [Why Do We Need It?](#why-do-we-need-it)
  - [How to Create a Key Pair?](#how-to-create-a-key-pair)
  - [Create an SSH Key Pair](#create-an-ssh-key-pair)
  - [Adding SSH key to Github](#adding-ssh-key-to-github)
    - [Register a key](#register-a-key)
  - [Changing a initialised repo](#changing-a-initialised-repo)
    - [Example](#example)
    - [Additional Steps](#additional-steps)

## What is SSH?

SSH (Secure Shell) is a protocol that allows secure access to a remote machine over an unsecured network. It is commonly used to manage servers and virtual machines.

## Why Do We Need It?

SSH is crucial for securely accessing, controlling, and transferring data between machines in a network without exposing sensitive information to potential threats.

## How to Create a Key Pair?

SSH key pairs consist of a public and private key. The public key is stored on the server, while the private key is kept secure on the local machine. This pair allows for passwordless authentication while maintaining security.

## Create an SSH Key Pair

You can create an SSH key pair via Azure, AWS, or manually. The private key remains on your local machine, while the public key is uploaded to Azure for authentication.

Follow these steps to create an SSH key pair manually:

1. Open **Git Bash**.
2. Navigate to your home directory (e.g., `C:/Users/yourname`).
3. Create a `.ssh` folder if it doesn't exist:

   ```bash
   mkdir .ssh
   ```

4. Navigate into the `.ssh` folder:

   ```bash
   cd .ssh
   ```

5. Generate the SSH key pair using the `ssh-keygen` command:

   ```bash
   ssh-keygen -t rsa -b 4096 -C "your email address"
   ```

   - `-t` specifies the key type (RSA).
   - `-b` sets the key length to 4096 bits.
   - `-C` adds an identifier (your email).
6. When prompted, name the key `tech264-karis-az-key` and press **Enter**.
7. Skip the passphrase by pressing **Enter** again.
8. A `.pub` file is generated, which contains the public key.
9. View the public key with the following command:

   ```bash
   cat tech264-karis-az-key.pub
   ```

10. Copy the public key output to Azure.
11. Search for **SSH Keys** in Azure.
12. Name the key the same as the local machine's key (`tech264-karis-az-key`).
13. Paste the exact public key, ensuring it starts with `ssh-rsa` and ends with your email.
14. Tag the key with your name as the owner.
15. Click **Create**.

## Adding SSH key to Github

1. Generate a new SSH key.
2. Print the **public** key using `cat`. This will be given to GitHub.
3. Navigate to your **Settings** on GitHub.
4. Find **SSH Keys and GPG keys** and add **New SSH key**.
5. Name the key appropriately.
6. Insert what you printed and save.

### Register a key

1. Start your ssh agent with ```eval `ssh-agent -s` ```
2. `ssh-add` your `private key`. This will add your identity.
3. **Test** your connection to GitHub using `ssh -T git@github.com`.
4. You will either get a prompt to then type `yes`, or it will say you're successfuly authenticated. This works **ANYWHERE** in your directory.

## Changing a initialised repo

To change an initialized Git repository to use SSH instead of HTTPS, follow these steps:

1. **Check Current Remote URL**: First, verify the current remote URL to see if it's using HTTPS.

    ```bash
    git remote -v
    ```

2. **Change Remote URL to SSH**: Replace the HTTPS URL with the SSH URL. You can do this using the `git remote set-url` command.

    ```bash
    git remote set-url origin git@github.com:username/repo.git
    ```

    Replace `username` with your GitHub username and `repo.git` with the name of your repository.

3. **Verify the Change**: Confirm that the remote URL has been updated to use SSH.

    ```bash
    git remote -v
    ```

### Example

Let's say your current remote URL is:

```
origin  https://github.com/username/repo.git (fetch)
origin  https://github.com/username/repo.git (push)
```

To change it to SSH, you would run:

```bash
git remote set-url origin git@github.com:username/repo.git
```

After running the command, verify the change:

```bash
git remote -v
```

The output should now be:

```
origin  git@github.com:username/repo.git (fetch)
origin  git@github.com:username/repo.git (push)
```

### Additional Steps

1. **Generate SSH Key (if not already done)**:

    ```bash
    ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
    ```

    Follow the prompts to save the key.

2. **Add SSH Key to SSH Agent**:

    ```bash
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_rsa
    ```

3. **Add SSH Key to GitHub**:
    - Copy the SSH key to your clipboard:

        ```bash
        cat ~/.ssh/id_rsa.pub
        ```

    - Go to GitHub > Settings > SSH and GPG keys > New SSH key, and paste the key.
