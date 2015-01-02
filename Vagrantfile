Vagrant.configure('2') do |config|
  config.vm.define :znc do |guest|
    guest.vm.provision :chef_solo do |chef|
      chef.run_list = %w(znc)
    end
  end
end
