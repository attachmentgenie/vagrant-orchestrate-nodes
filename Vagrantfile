Vagrant::Config.run do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  config.ssh.max_tries = 50
  config.ssh.timeout   = 300

  config.vm.define :puppetmaster do |puppetmaster_config|
    puppetmaster_config.vm.provision :puppet do |puppet|
        puppet.manifests_path = "manifests"
        puppet.module_path = "modules"
        puppet.manifest_file = "puppetmaster.pp"
    end
  end
end