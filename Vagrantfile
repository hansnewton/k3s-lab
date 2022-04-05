# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  
  # box with guet additions for centos7
  config.vm.box = "bento/centos-7" 

  # forçar login por senha
  #config.ssh.username = 'vagrant'
  #config.ssh.password = 'vagrant'
  #config.ssh.insert_key = false

  # source: https://github.com/hashicorp/vagrant/issues/7811
  # forcing bidirectional with virtualbox
  # only works with box that contains guest additions
  config.vm.synced_folder ".", "/vagrant", type: 'virtualbox'

  config.vm.define 'k3s-manager' do |m|
    
    m.vm.network "private_network", ip: "192.168.56.10", :netmask => "255.255.255.0"
    m.vm.hostname = "k3s-manager"

    m.vm.provider :virtualbox do |v|
      v.name = 'k3s-manager'
      v.memory = 512
      v.cpus = 1
    end

    m.vm.provision :shell do |shell| 
      shell.path = "manager.sh"
      shell.privileged = true
    end
    
  end

  config.vm.define 'k3s-node01' do |m|
    
    m.vm.network "private_network", ip: "192.168.56.11", :netmask => "255.255.255.0"
    m.vm.hostname = "k3s-node01"

    m.vm.provider :virtualbox do |v|
      v.name = 'k3s-node01'
      v.memory = 512
      v.cpus = 1
    end

    m.vm.provision :shell do |shell| 
      shell.path = "worker.sh"
      shell.privileged = true
    end

  end

  config.vm.define 'k3s-node02' do |m|
    
    m.vm.network "private_network", ip: "192.168.56.12", :netmask => "255.255.255.0"
    m.vm.hostname = "k3s-node02"

    m.vm.provider :virtualbox do |v|
      v.name = 'k3s-node02'
      v.memory = 512
      v.cpus = 1
    end

    m.vm.provision :shell do |shell| 
      shell.path = "worker.sh"
      shell.privileged = true
    end

  end
end
