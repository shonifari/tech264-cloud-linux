# Running the Sparta App and Port Conflict

1. **Initial Attempt**:
   - You try to run the Sparta app from two different Git Bash terminals on the same VM simultaneously.
   - However, you encounter an error because the second instance of the app is attempting to use port 3000, which is already in use by the first instance.

2. **Error Message**:
   - The error message typically looks something like this:

     ```text
     Error: listen EADDRINUSE: address already in use :::3000
     ```

3. **Explanation**:
   - The error occurs because port 3000 is already bound by the first instance of the Sparta app. When the second instance tries to start, it cannot use the same port.

4. **Solution**:
   - To fix this, you need to free up port 3000 for the second instance.
   - Here's how:

     - **Step 1: Identify the Process Using Port 3000**
       - We'll use a Linux command to find the process (and its associated PID) that is currently using port 3000.
       - Open your terminal (e.g., Git Bash) and run the following command:

         ```bash
         lsof -i :3000
         ```

       - This will display information about the process using port 3000, including its PID (Process ID).

     - **Step 2: Terminate the Process**
       - Once you have the PID, you can terminate the process.
       - Use the following command, replacing `<PID>` with the actual PID you obtained:

         ```bash
         kill <PID>
         ```

       - For example:

         ```bash
         kill 1234
         ```

     - **Step 3: Retry Running the Sparta App**
       - Now that port 3000 is free, you can re-run the Sparta app without any conflicts.
       - Navigate to your Sparta app directory and start it again:

         ```bash
         npm start
         ```
