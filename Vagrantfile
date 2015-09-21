# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box     = 'centos66-nocm'
  config.vm.box_url = "http://10.12.1.72:8000/centos66-nocm-2.0.3.box"
  config.vm.provision "shell", path: 'bootstrap.sh'
end
