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


#### Software Installation and Configurations on Remote
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


#### Developer's Machine for Capistrano
##### Install Capistrano
```bash
sudo gem install capistrano
```

##### Configure SSH Public Key Authentication for unode000 ~ unode004
First, need to generate public/private keypair and change their permissions with following commands:

```bash
ssh-keygen -t dsa
chmod 700 $HOME/.ssh
chmod 600 $HOME/.ssh/id_dsa*
```

Second, copy the content of `$HOME/.ssh/id_dsa.pub`.

Third, login the remote unodexxx:

```bash
ssh smith@unode000.local
mkdir $HOME/.ssh
chmod 700 $HOME/.ssh
vim $HOME/.ssh/authorized_keys
# And, paste the content of id_dsa.pub to vim and then save & close.
chmod 600 authorized_keys
```

#### Software Installation and Configurations on Remote (via batch)
Before installing all softwares on several machines with `Capistrano`, the file `Capfile` shall be created at local directory first:

```ruby
role :libs, "smith@unode001.local", 
            "smith@unode002.local", 
            "smith@unode003.local", 
            "smith@unode004.local"
```

With the `Capfile`, Capistrano can know which remote servers to be configured at same time.


##### GIT
```bash
cap invoke COMMAND="apt-get -q -y install git" SUDO=1
```

##### WGET

```bash
cap invoke COMMAND="apt-get -q -y install wget" SUDO=1
```

##### Vagrant

```bash
cap invoke COMMAND="wget http://files.vagrantup.com/packages/7e400d00a3c5a0fdf2809c8b5001a035415a607b/vagrant_1.2.2_x86_64.deb"
cap invoke COMMAND="dkpg -i vagrant_1.2.2_x86_64.deb" SUDO=1
cap invoke COMMAND="vagrant plugin install vagrant-berkshelf" SUDO=1
```




## References
- [Using SSH Public Key Authentication](http://macnugget.org/projects/publickeys/)
- ...

