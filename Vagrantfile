Vagrant::Config.run do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  config.ssh.max_tries = 50
  config.ssh.timeout   = 300
  config.vm.forward_port 80, 80
  config.vm.forward_port 8080, 8080
  config.vm.forward_port 8160, 8160
  config.vm.share_folder "project", "/home/vagrant/orchestrate-nodes", "."
  config.vm.define :puppetmaster do |puppetmaster_config|
    puppetmaster_config.vm.provision :puppet do |puppet|
        puppet.manifests_path = "manifests"
        puppet.module_path = "modules"
        puppet.manifest_file = "server.pp"
    end
  end
end
