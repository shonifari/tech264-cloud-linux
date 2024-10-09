
# What is an environment variable and how do we make one?

An **environment variable** is a dynamic **variable** stored in a process environment. It is used to **pass** configuration information and settings to processes running in the system. These **variables** can influence the behavior of software and system components by providing information such as paths, user preferences, and system settings.

- To view these, we can use the command `printenv`.
- We can view a certain environment variable by using `printenv VARIABLENAME`.
- To set a **variable**, we can use `VARIABLENAME=data`. This is a **shell variable**. To ensure this worked, we could use `echo $VARIABLENAME`, which would then output the `data` value. **Note** that this is **NOT** the same as an **enviornment variable**.
- To set an **environment variable**, we can use `export VARIABLENAME=data`, Which would then display it if we used `printenv MYNAME`. If we were to log out, the created **environment variable** would disappear as it is not **persistent**.
- If we were to set our **environment variable** inside of the hidden `.bashrc`, it would be visible to the user (admin) across sessions, making it **persistent**. **Note** that `.bashrc` is unique to the user. We can do this by using `nano .bashrc` and writing `export VARIABLENAME=data` in the file.
  
* `sleep 3` to sleep for 3 seconds in the foreground - To stop this `Ctrl + Z` or `Ctrl + C`.
* `sleep 5000 &` (this will give you an Process ID output) to tick in the background and not engage the terminal - To stop this `kill -1 <PID>` (`PID`: Process ID) (64 kill signals and -1 is the lightest).
* `kill <PID>` can be used on its own and is the same as `-15` (default - terminate).
* `kill -9 <PID>` is for brute force kill but this can leave zombie instances (instances still running in the memory with no parent process that can manage it and then needs to be manually killed).
* `ps` - to check user processes, `ps aux` - to check a lot of processes.
* `top` - to check CPU usage, `Ctrl + M` for memory, `Ctrl + N` for descending order of PID, `Ctrl + P` to go back to the CPU usage


Feedback Priyan

1

No reading ?
A bit over 90 sec
Compared to other answer doesn't sound natural

2 Git
good

3 Biggest weaknesses

needs to follow star

4 How to implement DevOps

good