# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # Instruct to install Chef Client.
  config.omnibus.chef_version = :latest

  # Every Vagrant virtual environment requires a box to build off of.
  #config.vm.box = "ubuntu-12.04"
  config.vm.box = "centos-6.4"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  #config.vm.box_url = "https://opscode-vm.s3.amazonaws.com/vagrant/opscode_ubuntu-12.04_provisionerless.box"
  config.vm.box_url = "https://opscode-vm-bento.s3.amazonaws.com/vagrant/opscode_centos-6.4_provisionerless.box"

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  config.vm.network :forwarded_port, guest: 8080, host: 8080

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  config.vm.provider :virtualbox do |vb|
     # Use VBoxManage to customize the VM. For example to change memory:
     vb.customize ["modifyvm", :id, "--memory", "512"]
   end

  # Enable provisioning with chef solo, specifying a cookbooks path, roles
  # path, and data_bags path (all relative to this Vagrantfile), and adding
  # some recipes and/or roles.
  config.vm.provision :chef_solo do |chef|
    #chef.log_level = :debug
    chef.cookbooks_path = "cookbooks"
    chef.add_recipe "build-essential"
    chef.add_recipe "golang"
    chef.add_recipe "mercurial"
    chef.add_recipe "git"
    chef.add_recipe "doozer::doozer"
    chef.add_recipe "doozer::default"

    chef.json = {
      'go' => {
        'platform' => 'amd64',
        'version' => '1.1'
      }
    }
  end
end
