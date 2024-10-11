# Running sparta app in the background

## Running, Stopping, and Restarting the App

### 1. Using PM2

[PM2](https://pm2.keymetrics.io/) is a popular process manager for Node.js applications. It provides features like process management, monitoring, and zero-downtime reload. Here's how you can use PM2:

1. Install PM2 globally (if not already installed):

   ```**bash**
   npm install -g pm2
   ```

2. Start your app with PM2:

   ```bash
   pm2 start app.js
   ```

3. To stop the app:

   ```bash
   pm2 stop app
   ```

4. To restart the app:

   ```bash
   pm2 restart app
   ```

### 2. Alternative to PM2: Forever

[Forever](https://github.com/foreversd/forever) is a simple CLI tool that ensures a given script runs continuously. It's lightweight and easy to use. However, it may lack some advanced features compared to PM2.

To use Forever:

1. Install Forever globally (if not already installed):

   ```bash
   npm install -g forever
   ```

2. Start your app with Forever:

   ```bash
   forever start app.js
   ```

3. To stop the app:

   ```bash
   forever stop app
   ```

### Issue with Using `&` at the End of the Command

When using the `&` symbol at the end of the command to run an app in the background, there are a couple of limitations:

- **Lack of Process Management**: The `&` approach doesn't provide process management features like automatic restarts, monitoring, or log handling. If the app crashes, you won't know about it unless you manually check.

- **Difficulty in Stopping/Restarting**: Stopping or restarting the app becomes challenging. You need to find the process ID (PID) and manually kill it, which can be cumbersome.

## Checking the App in Your Browser

Assuming your app is running on port 3000, follow these steps:

1. Open your browser.
2. Enter the following URL:

   ```text
   http://<VM_IP>:3000
   ```

   Replace `<VM_IP>` with the actual IP address of your Azure VM.

If your reverse proxy is configured correctly, you can omit the port number:

   ```text
   http://<VM_IP>
   ```
