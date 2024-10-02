# SSH Documentation

## Table of Contents

- [SSH Documentation](#ssh-documentation)
  - [Table of Contents](#table-of-contents)
  - [What is SSH?](#what-is-ssh)
  - [Why Do We Need It?](#why-do-we-need-it)
  - [How to Create a Key Pair?](#how-to-create-a-key-pair)
  - [Create an SSH Key Pair](#create-an-ssh-key-pair)

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
