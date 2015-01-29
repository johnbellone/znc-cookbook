# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.hostname = "znc-berkshelf"
  config.vm.box = "vagrant-ubuntu-12.04"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  config.vm.network :private_network, ip: "33.33.33.10"
  config.vm.network :forwarded_port, guest: 7777, host: 7777
  config.ssh.max_tries = 40
  config.ssh.timeout   = 120
  config.berkshelf.enabled = true
  config.omnibus.chef_version = :latest

  config.vm.provision :chef_solo do |chef|
    chef.log_level = :debug
    chef.data_bags_path = "test/integration/data_bags"
    chef.json = {
      :znc => {
        :install_method => 'source'
      }
    }

    chef.run_list = [
        "recipe[chef-solo-search]",
        "recipe[apt]",
        "recipe[znc]"
    ]
  end
end
