# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

#define vm name
NAME = "oracle12c-vagrant"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "centos/7"

  config.vm.provider "hyperv" do |h|
    h.memory = 2048
    h.cpus = 2
    h.vmname = NAME
    h.enable_virtualization_extensions = true
    h.linked_clone = true
  end

  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
    v.cpus = 2
    v.name = NAME
    v.customize ["modifyvm", :id, "--cableconnected1", "on"]
    v.customize ["modifyvm", :id, "--ioapic", "on"]
    v.customize ["modifyvm", :id, "--cpuexecutioncap", "100"]
  end

  # Set Network
  if Vagrant::Util::Platform.windows? then
    # Hyper-V provider:
    #config.vm.network "private_network", bridge: "VagrantNAT", ip: "10.0.74.2", auto_config: false
    config.vm.network "private_network", ip: "10.0.74.2", auto_config: false
  else
    # VirtualBox provier:
    # Oracle port forwarding
    config.vm.network "forwarded_port", guest: 1521, host: 1521
  end

  # Provision everything on the first run
  config.vm.provision "file", source: "install", destination: "~/"
  config.vm.provision "shell", path: "scripts/vagrant-dir.sh"
  config.vm.provision "shell", path: "scripts/install.sh"
  config.vm.provision "shell", inline: "rm -rf /vagrant/database"
  config.vm.provision "shell", inline: "rm -f /vagrant/*.zip"

  config.vm.synced_folder ".", "/vagrant", disabled: true
end
