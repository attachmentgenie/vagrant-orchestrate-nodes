# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

###############################################################################
# Base box                                                                    #
###############################################################################
    config.vm.box              = "puppetlabs/centos-6.6-64-puppet"
    config.vm.box_version      = '1.0.1'
    config.vm.box_check_update = false

###############################################################################
# Global plugin settings                                                      #
###############################################################################
    plugins = ["vagrant-hostmanager"]
    plugins.each do |plugin|
      unless Vagrant.has_plugin?(plugin)
        raise plugin << " has not been installed."
      end
    end

    # Configure cached packages to be shared between instances of the same base box.
    if Vagrant.has_plugin?("vagrant-cachier")
      config.cache.scope = :machine
    end

    # When destroying a node, delete the node from the puppetmaster
    if Vagrant.has_plugin?("vagrant-triggers")
      config.trigger.after [:destroy] do
        target = @machine.config.vm.hostname.to_s
        puppetmaster = "puppetmaster"
        if target != puppetmaster
          system("vagrant ssh #{puppetmaster} -c 'sudo /usr/bin/puppet cert clean #{target}'" )
        end
      end
    end

###############################################################################
# Global provisioning settings                                                #
###############################################################################
    env = 'xxs'

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
# Global /etc/hosts file settings                                             #
###############################################################################
    config.hostmanager.enabled = true
    config.hostmanager.manage_host = true
    config.hostmanager.ignore_private_ip = false
    config.hostmanager.include_offline = true

###############################################################################
# VM definitions                                                              #
###############################################################################
    config.vm.synced_folder ".", "/vagrant", disabled: true
    config.vm.synced_folder ".", "/vagrant", disabled: true
    config.vm.define :puppet do |puppet_config|
      config.vm.provider "virtualbox" do |v|
        v.memory = 2048
        v.cpus   = 2
      end
      puppet_config.vm.host_name = "puppet.testlab.vagrant"
      puppet_config.vm.network :private_network, ip: "192.168.42.130"
      puppet_config.vm.network :forwarded_port, guest: 22, host: 4230
      puppet_config.vm.synced_folder 'manifests/', "/etc/puppet/environments/#{env}/manifests"
      puppet_config.vm.synced_folder 'modules/', "/etc/puppet/environments/#{env}/modules"
      puppet_config.vm.synced_folder 'hiera/', '/var/lib/hiera'
      puppet_config.vm.provision :puppet do |puppet|
          puppet.options           = "--environment #{env}"
          puppet.manifests_path    = "manifests"
          puppet.manifest_file     = ""
          puppet.module_path       = "modules"
          puppet.hiera_config_path = "hiera.yaml"
      end
    end
    
    config.vm.define :orchestrate1 do |orchestrate1_config|
      orchestrate1_config.vm.host_name = "orchestrate1.testlab.vagrant"
      orchestrate1_config.vm.network :forwarded_port, guest: 22, host: 4231
      orchestrate1_config.vm.network :private_network, ip: "192.168.42.131"
      orchestrate1_config.vm.provider "virtualbox" do |v|
        v.cpus   = 2
        v.memory = 2048
      end
      orchestrate1_config.vm.provision 'shell', inline: SCRIPT
    end

    config.vm.define :monitor1 do |monitor1_config|
      monitor1_config.vm.host_name = "monitor1.testlab.vagrant"
      monitor1_config.vm.network :forwarded_port, guest: 22, host: 4232
      monitor1_config.vm.network :private_network, ip: "192.168.42.132"
      monitor1_config.vm.provision 'shell', inline: SCRIPT
    end

    config.vm.define :repo1 do |repo1_config|
      repo1_config.vm.host_name = "repo1.testlab.vagrant"
      repo1_config.vm.network :forwarded_port, guest: 22, host: 4233
      repo1_config.vm.network :private_network, ip: "192.168.42.133"
      repo1_config.vm.provision 'shell', inline: SCRIPT
    end

    config.vm.define :hypervisor1 do |hypervisor1_config|
      hypervisor1_config.vm.host_name = "hypervisor1.testlab.vagrant"
      hypervisor1_config.vm.network :forwarded_port, guest: 22, host: 4240
      hypervisor1_config.vm.network :private_network, ip: "192.168.42.140"
      hypervisor1_config.vm.provision 'shell', inline: SCRIPT
    end

    config.vm.define :node1 do |node1_config|
      node1_config.vm.box = "puppetlabs/centos-7.0-64-puppet"
      node1_config.vm.host_name = "node1.testlab.vagrant"
      node1_config.vm.network :forwarded_port, guest: 22, host: 4250
      node1_config.vm.network :private_network, ip: "192.168.42.150"
      node1_config.vm.provision 'shell', inline: SCRIPT
    end

    config.vm.define :node2 do |node2_config|
      node2_config.vm.host_name = "node2.testlab.vagrant"
      node2_config.vm.network :forwarded_port, guest: 22, host: 4251
      node2_config.vm.network :private_network, ip: "192.168.42.151"
      node2_config.vm.provision 'shell', inline: SCRIPT
    end

    config.vm.define :node3 do |node3_config|
      node3_config.vm.box = "puppetlabs/ubuntu-14.04-64-puppet"
      node3_config.vm.host_name = "node3.testlab.vagrant"
      node3_config.vm.network :forwarded_port, guest: 22, host: 4252
      node3_config.vm.network :private_network, ip: "192.168.42.152"
      node3_config.vm.provision 'shell', inline: SCRIPT
    end

    config.vm.define :node4 do |node4_config|
      node4_config.vm.box = "puppetlabs/ubuntu-12.04-64-puppet"
      node4_config.vm.host_name = "node4.testlab.vagrant"
      node4_config.vm.network :forwarded_port, guest: 22, host: 4253
      node4_config.vm.network :private_network, ip: "192.168.42.153"
      node4_config.vm.provision 'shell', inline: SCRIPT
    end

    config.vm.define :node5 do |node5_config|
      node5_config.vm.box = "puppetlabs/debian-7.8-64-puppet"
      node5_config.vm.host_name = "node5.testlab.vagrant"
      node5_config.vm.network :forwarded_port, guest: 22, host: 4254
      node5_config.vm.network :private_network, ip: "192.168.42.154"
      node5_config.vm.provision 'shell', inline: SCRIPT
    end

    config.vm.define :node6 do |node6_config|
      node6_config.vm.box = "puppetlabs/debian-6.0.10-64-puppet"
      node6_config.vm.host_name = "node6.testlab.vagrant"
      node6_config.vm.network :forwarded_port, guest: 22, host: 4255
      node6_config.vm.network :private_network, ip: "192.168.42.155"
      node6_config.vm.provision 'shell', inline: SCRIPT
    end

    config.vm.define :proxy1 do |proxy1_config|
      proxy1_config.vm.host_name = "proxy1.testlab.vagrant"
      proxy1_config.vm.network :forwarded_port, guest: 22, host: 4260
      proxy1_config.vm.network :private_network, ip: "192.168.42.160"
      proxy1_config.vm.provision 'shell', inline: SCRIPT
    end
end