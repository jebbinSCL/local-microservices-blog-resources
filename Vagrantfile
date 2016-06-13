# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  # Possible boxes
  # This is a minimal ubuntu desktop
  config.vm.box = "amplifi/ubuntu-desktop-14.04.minimal"
  config.vm.post_up_message = "Vagrant Provision complete. \nLogin with with password vagrant for vagrant user."

  config.vm.network "forwarded_port", guest: 8080, host: 8080, host_ip: "127.0.0.1"
  # This will run in a host-only network
  config.vm.network "private_network", ip: "192.168.56.101"



  config.vm.provider "virtualbox" do |vb|
  	vb.gui = true
    vb.memory = "2048"
    vb.customize ["modifyvm", :id, "--vram", "50"]
    vb.cpus = 2
  end

  config.vm.synced_folder ".", "/vagrant", disabled:true
  config.vm.synced_folder ".", "/workspace"

  #Configure up with scripts
  config.vm.provision "shell", path: "vagrantScripts/utils.sh"

  config.vm.provision "shell", path: "vagrantScripts/backend-docker.sh"

  config.vm.provision "shell", path: "vagrantScripts/backend-mono.sh"

  #Kill session for vagrant and force user to login to refresh user groups.
  config.vm.provision "shell", inline: "sudo pkill -u vagrant"
end
