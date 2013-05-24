private_cloud
=============

This is my 1st private cloud.


### Hardware
There are 5 physical PC(s) with following specification
- CPU, Intel Core i5 2.67 GHz
- RAM, 4GB (DDR3 2X2GB)
- HDD, 320GB or above

### Preparations
#### Operating System and Default Account
Each physical PC, installed with [Ubuntu 12.04 TLS 64bits](http://www.ubuntu.com/download/desktop), represents as one `unode`. So, there are total 5 unodes:
- unode000
- unode001
- unode002
- unode003
- unode004

Each physical PC can be accessed with the hostname `unodexxx.local`, such as `unode003.local`. The default user account is `smith`.


#### Software Installation and Configurations
After Ubuntu OS is installed, then install following softwares:

##### Vim
```bash
sudo apt-get install vim
```

##### Sudoers
Let's add `smith` into the `/etc/sudoers` without promot password. Please type `sudo vim /etc/sudoers`, and add following line into the sudoers file:

```text
smith ALL=(ALL) NOPASSWORD: ALL
```


##### OpenSSH Server
```bash
sudo apt-get install openssh-server
```

After installing the openssh server, please uncomment following 2 lines in `/etc/ssh/sshd_config`

```
# GSSAPIAuthentication no
# GSSAPICleanupCredentials yes
```

Then, restart openssh service:

```bash
sudo service ssh restart
```



