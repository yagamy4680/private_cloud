# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

VM_INTERFACES = %x( VBoxManage list bridgedifs | grep ^Name ).gsub(/Name:\s+/, '').split("\n")
IF_INTERFACE = VM_INTERFACES[0]

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "ffuenf/ubuntu-14.04-server-amd64"

  # Setup the hostname
  config.vm.hostname = "pcloud"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  config.vm.network :public_network, :bridge => IF_INTERFACE

  # Enable `vagrant-cachier` to cache APT packages
  #
  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  end

  # Enable the vm with 4 CPU cores, 1G ram, and usb host.
  #
  config.vm.provider :virtualbox do |vb|
    vb.gui = false
    vb.customize ["modifyvm", :id, "--memory", "1024"]
    vb.customize ["modifyvm", :id, "--cpus", "4"]
    vb.customize ["modifyvm", :id, "--usb", "on"]
    vb.customize ["modifyvm", :id, "--usbehci", "on"]
  end

  # If true, then any SSH connections made will enable agent forwarding.
  # Default value: false
  # config.ssh.forward_agent = true

  # Initiate the vagrant box by adding user "smith" as sudoer and enable
  # openssh/avahi-daemon services.
  #
  # config.vm.provision "shell", inline: "sudo /vagrant/pylon_init.sh"
  config.vm.provision "shell", inline: "wget -qO- https://raw.githubusercontent.com/yagamy4680/private_cloud/master/pylon_init.sh | sudo /bin/bash"
end
