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
  config.vm.box = "precise64"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  config.vm.network :public_network, :bridge => IF_INTERFACE

  # If true, then any SSH connections made will enable agent forwarding.
  # Default value: false
  # config.ssh.forward_agent = true

  # Initiate the vagrant box by adding user "smith" as sudoer and enable
  # openssh/avahi-daemon services.
  #
  config.vm.provision "shell", inline: "sudo /vagrant/pylon_init.sh"
end
