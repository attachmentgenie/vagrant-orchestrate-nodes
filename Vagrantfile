# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

###############################################################################
# Base box                                                                    #
###############################################################################
    config.vm.box = "puppetlabs/centos-6.6-64-puppet"

###############################################################################
# Global provisioning settings                                                #
###############################################################################
    config.vm.synced_folder 'hiera/', '/var/lib/hiera'
    config.vm.provision :puppet do |puppet|
        default_env = 'development'
        ext_env = ENV['VAGRANT_PUPPET_ENV']
        env = ext_env ? ext_env : default_env
        puppet.options = "--environment #{env}"
        puppet.manifests_path = "manifests"
        puppet.manifest_file  = ""
        puppet.module_path = "modules"
        puppet.hiera_config_path = "hiera.yaml"
    end

###############################################################################
# Global VirtualBox settings                                                  #
###############################################################################
    config.vm.provider 'virtualbox' do |v|
    v.customize [
      'modifyvm', :id,
      '--groups', '/Vagrant/orchestrate-nodes'
    ]
    end

###############################################################################
# VM definitions                                                              #
###############################################################################
    config.vm.define :orchestrate1 do |orchestrate1_config|
      orchestrate1_config.vm.network :private_network, ip: "192.168.21.130"
      orchestrate1_config.vm.host_name = "orchestrate1.testlab.vagrant"
    end

    config.vm.define :log1 do |log1_config|
      log1_config.vm.network :private_network, ip: "192.168.21.131"
      log1_config.vm.host_name = "log1.testlab.vagrant"
    end

    config.vm.define :monitor1 do |monitor1_config|
      monitor1_config.vm.network :private_network, ip: "192.168.21.132"
      monitor1_config.vm.host_name = "monitor1.testlab.vagrant"
    end

    config.vm.define :dashboard1 do |dashboard1_config|
      dashboard1_config.vm.network :private_network, ip: "192.168.21.133"
      dashboard1_config.vm.host_name = "dashboard1.testlab.vagrant"
    end

    config.vm.define :repo1 do |repo1_config|
      repo1_config.vm.network :private_network, ip: "192.168.21.134"
      repo1_config.vm.host_name = "repo1.testlab.vagrant"
    end

    config.vm.define :git1 do |git1_config|
      git1_config.vm.network :private_network, ip: "192.168.21.135"
      git1_config.vm.host_name = "git1.testlab.vagrant"
    end

    config.vm.define :ci1 do |ci1_config|
      config.vm.provider "virtualbox" do |v|
        v.memory = 2048
      end
      ci1_config.vm.network :private_network, ip: "192.168.21.136"
      ci1_config.vm.host_name = "ci1.testlab.vagrant"
    end

    config.vm.define :hypervisor1 do |hypervisor1_config|
      hypervisor1_config.vm.network :private_network, ip: "192.168.21.140"
      hypervisor1_config.vm.host_name = "hypervisor1.testlab.vagrant"
    end

    config.vm.define :proxy1 do |proxy1_config|
      proxy1_config.vm.network :private_network, ip: "192.168.21.141"
      proxy1_config.vm.host_name = "proxy1.testlab.vagrant"
    end

    config.vm.define :node1 do |node1_config|
      node1_config.vm.network :private_network, ip: "192.168.21.151"
      node1_config.vm.host_name = "node1.testlab.vagrant"
    end

    config.vm.define :node2 do |node2_config|
      node2_config.vm.box = "puppetlabs/ubuntu-14.04-64-puppet"
      node2_config.vm.network :private_network, ip: "192.168.21.152"
      node2_config.vm.host_name = "node2.testlab.vagrant"
    end

    config.vm.define :node3 do |node3_config|
      node3_config.vm.box = "puppetlabs/ubuntu-12.04-64-puppet"
      node3_config.vm.network :private_network, ip: "192.168.21.153"
      node3_config.vm.host_name = "node3.testlab.vagrant"
    end

    config.vm.define :node4 do |node4_config|
      node4_config.vm.box = "puppetlabs/debian-7.6-64-puppet"
      node4_config.vm.network :private_network, ip: "192.168.21.154"
      node4_config.vm.host_name = "node4.testlab.vagrant"
    end

    config.vm.define :node5 do |node5_config|
      node5_config.vm.box = "dhoppe/debian-6.0.10-amd64"
      node5_config.vm.network :private_network, ip: "192.168.21.155"
      node5_config.vm.host_name = "node5.testlab.vagrant"
    end
end
