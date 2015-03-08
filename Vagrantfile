# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|

  config.vm.box = "puppetlabs/centos-6.5-64-puppet"

  config.vm.provider 'virtualbox' do |v|
    v.customize [
      'modifyvm', :id,
      '--groups', '/Vagrant/orchestrate-nodes'
    ]
  end

  config.vm.define :orchestrate1 do |orchestrate1_config|
    orchestrate1_config.vm.network :private_network, ip: "192.168.21.130"
    orchestrate1_config.vm.host_name = "orchestrate1.vagrant"
    orchestrate1_config.vm.provision :puppet do |orchestrate1_puppet|
      orchestrate1_puppet.manifests_path = "manifests"
      orchestrate1_puppet.module_path = "modules"
      orchestrate1_puppet.manifest_file = "site.pp"
    end
  end

  config.vm.define :log1 do |log1_config|
    log1_config.vm.network :private_network, ip: "192.168.21.131"
    log1_config.vm.host_name = "log1.vagrant"
    log1_config.vm.provision :puppet do |log1_puppet|
      log1_puppet.manifests_path = "manifests"
      log1_puppet.module_path = "modules"
      log1_puppet.manifest_file = "site.pp"
    end
  end

  config.vm.define :monitor1 do |monitor1_config|
    monitor1_config.vm.network :private_network, ip: "192.168.21.132"
    monitor1_config.vm.host_name = "monitor1.vagrant"
    monitor1_config.vm.provision :puppet do |monitor1_puppet|
      monitor1_puppet.manifests_path = "manifests"
      monitor1_puppet.module_path = "modules"
      monitor1_puppet.manifest_file = "site.pp"
    end
  end

  config.vm.define :dashboard1 do |dashboard1_config|
    dashboard1_config.vm.network :private_network, ip: "192.168.21.133"
    dashboard1_config.vm.host_name = "dashboard1.vagrant"
    dashboard1_config.vm.provision :puppet do |dashboard1_puppet|
      dashboard1_puppet.manifests_path = "manifests"
      dashboard1_puppet.module_path = "modules"
      dashboard1_puppet.manifest_file = "site.pp"
    end
  end

  config.vm.define :ci1 do |ci1_config|
    config.vm.provider "virtualbox" do |v|
      v.memory = 2048
    end
    ci1_config.vm.network :private_network, ip: "192.168.21.134"
    ci1_config.vm.host_name = "ci1.vagrant"
    ci1_config.vm.provision :puppet do |ci1_puppet|
      ci1_puppet.manifests_path = "manifests"
      ci1_puppet.module_path = "modules"
      ci1_puppet.manifest_file = "site.pp"
    end
  end

  config.vm.define :proxy1 do |proxy1_config|
    proxy1_config.vm.network :private_network, ip: "192.168.21.140"
    proxy1_config.vm.host_name = "proxy1.vagrant"
    proxy1_config.vm.provision :puppet do |proxy1_puppet|
      proxy1_puppet.manifests_path = "manifests"
      proxy1_puppet.module_path = "modules"
      proxy1_puppet.manifest_file = "site.pp"
    end
  end

  config.vm.define :node1 do |node1_config|
    node1_config.vm.network :private_network, ip: "192.168.21.141"
    node1_config.vm.host_name = "node1.vagrant"
    node1_config.vm.provision :puppet do |node1_puppet|
      node1_puppet.manifests_path = "manifests"
      node1_puppet.module_path = "modules"
      node1_puppet.manifest_file = "site.pp"
    end
  end

  config.vm.define :node2 do |node2_config|
    node2_config.vm.box = "puppetlabs/ubuntu-14.04-64-puppet"
    node2_config.vm.network :private_network, ip: "192.168.21.142"
    node2_config.vm.host_name = "node2.vagrant"
    node2_config.vm.provision :puppet do |node2_puppet|
      node2_puppet.manifests_path = "manifests"
      node2_puppet.module_path = "modules"
      node2_puppet.manifest_file = "site.pp"
    end
  end

  config.vm.define :node3 do |node3_config|
    node3_config.vm.box = "puppetlabs/ubuntu-12.04-64-puppet"
    node3_config.vm.network :private_network, ip: "192.168.21.143"
    node3_config.vm.host_name = "node3.vagrant"
    node3_config.vm.provision :puppet do |node3_puppet|
      node3_puppet.manifests_path = "manifests"
      node3_puppet.module_path = "modules"
      node3_puppet.manifest_file = "site.pp"
    end
  end

  config.vm.define :node4 do |node4_config|
    node4_config.vm.box = "puppetlabs/debian-7.6-64-puppet"
    node4_config.vm.network :private_network, ip: "192.168.21.144"
    node4_config.vm.host_name = "node4.vagrant"
    node4_config.vm.provision :puppet do |node4_puppet|
      node4_puppet.manifests_path = "manifests"
      node4_puppet.module_path = "modules"
      node4_puppet.manifest_file = "site.pp"
    end
  end

  config.vm.define :node5 do |node5_config|
    node5_config.vm.box = "dhoppe/debian-6.0.10-amd64"
    node5_config.vm.network :private_network, ip: "192.168.21.145"
    node5_config.vm.host_name = "node5.vagrant"
    node5_config.vm.provision :puppet do |node5_puppet|
      node5_puppet.manifests_path = "manifests"
      node5_puppet.module_path = "modules"
      node5_puppet.manifest_file = "site.pp"
    end
  end
end
