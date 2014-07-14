# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.provider :digital_ocean do |provider, override|
    override.ssh.private_key_path = '~/.ssh/id_rsa'
    override.vm.box = 'digital_ocean'
    override.vm.box_url = "https://github.com/smdahlen/vagrant-digitalocean/raw/master/box/digital_ocean.box"

#   provider.client_id = 'b7eeed3646fc5c050f2807f8a85233c3'
    provider.client_id = ENV['DIGITAL_OCEAN_CLIENT_ID']
#   provider.api_key = 'e6f31ddd9eaf1db9c8621277bffe8c30'
    provider.api_key = ENV['DIGITAL_OCEAN_API_KEY']
  end

  config.omnibus.chef_version = :latest

  config.vm.define "jenkins2" do |node|
    node.vm.hostname = 'td.loganov.com'

    node.vm.provision :chef_client do |chef|
      chef.chef_server_url = 'https://chef.loganov.com:443'
      chef.validation_key_path = 'validation.pem'
      chef.validation_client_name = 'chef-validator'
      chef.delete_node = true
      chef.delete_client = true
      chef.add_role('loganov-base')
      chef.add_recipe('loganov-transmission')
    end

  end

end
