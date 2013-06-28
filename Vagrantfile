Vagrant.configure("2") do |config|
  config.omnibus.chef_version = :latest

  config.vm.define :ubuntu do |ubuntu|
    ubuntu.vm.box = 'ubuntu-12.04'
    ubuntu.vm.box_url = 'https://opscode-vm.s3.amazonaws.com/vagrant/opscode_ubuntu-12.04_provisionerless.box'
    ubuntu.vm.network :private_network, :ip => '172.0.1.1'
    ubuntu.vm.network :forwarded_port, :guest => 8080, :host => 8080
  end

  config.vm.define :centos do |centos|
    centos.vm.box = 'centos-6.4'
    centos.vm.box_url = 'https://opscode-vm-bento.s3.amazonaws.com/vagrant/opscode_centos-6.4_provisionerless.box'
    centos.vm.network :private_network, :ip => '172.0.1.2'
    centos.vm.network :forwarded_port, :guest => 8080, :host => 8081
  end

  config.vm.provider :virtualbox do |vb|
     vb.customize ["modifyvm", :id, "--memory", "256"]
   end

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "cookbooks"
    chef.add_recipe "build-essential"
    chef.add_recipe "golang"
    chef.add_recipe "mercurial"
    chef.add_recipe "git"
    chef.add_recipe "iptables"
    chef.add_recipe "doozer::doozer"
    chef.add_recipe "doozer::default"
    chef.add_recipe "doozer::iptables"

    chef.json = {
      'go' => {
        'platform' => 'amd64',
        'version' => '1.1'
      }
    }
  end
end
