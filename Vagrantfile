# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  # config.vm.box = "geerlingguy/centos7" # box with guet additions for centos7

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  #config.vm.synced_folder "./data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  #config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #    vb.memory = "512"
  #end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Ansible, Chef, Docker, Puppet and Salt are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL

  # box with guet additions for centos7
  config.vm.box = "geerlingguy/centos7" 

  # controll /etc/hosts in host and guests
  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true
  config.hostmanager.manage_guest = true
  config.hostmanager.ignore_private_ip = false
  config.hostmanager.include_offline = true

  # source: https://github.com/hashicorp/vagrant/issues/7811
  # forcing bidirectional with virtualbox
  # only works with box that contains guest additions
  config.vm.synced_folder ".", "/vagrant", type: 'virtualbox'

  config.vm.define 'k3s-master' do |m|
    
    m.vm.network "private_network", ip: "10.10.46.10", :netmask => "255.255.255.0"
    m.vm.hostname = "k3s-master.hans.dev"
    m.hostmanager.aliases = "k3s-master"

    m.vm.provider :virtualbox do |v|
      v.name = 'k3s-master'
      v.memory = 512
      v.cpus = 1
    end

    m.vm.provision :shell, :path => "master.sh"

    #m.vm.provision "shell", inline:<<-SHELL
    #SHELL
  end

  config.vm.define 'k3s-node01' do |m|
    
    m.vm.network "private_network", ip: "10.10.46.11", :netmask => "255.255.255.0"
    m.vm.hostname = "k3s-node01.hans.dev"
    m.hostmanager.aliases = "k3s-node01"

    m.vm.provider :virtualbox do |v|
      v.name = 'k3s-node01'
      v.memory = 512
      v.cpus = 1
    end

    m.vm.provision :shell, :path => "worker.sh"

    #m.vm.provision "shell", inline:<<-SHELL
    #SHELL
  end

  config.vm.define 'k3s-node02' do |m|
    
    m.vm.network "private_network", ip: "10.10.46.12", :netmask => "255.255.255.0"
    m.vm.hostname = "k3s-node02.hans.dev"
    m.hostmanager.aliases = "k3s-node02"

    m.vm.provider :virtualbox do |v|
      v.name = 'k3s-node02'
      v.memory = 512
      v.cpus = 1
    end

    m.vm.provision :shell, :path => "worker.sh"

    #m.vm.provision "shell", inline:<<-SHELL
    #SHELL
  end
end
