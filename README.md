[![Build Status](https://secure.travis-ci.org/attachmentgenie/vagrant-orchestrate-nodes.png)](http://travis-ci.org/attachmentgenie/vagrant-orchestrate-nodes)

# Setting up your nodes #

## Notes ##
Just thought you would want to know. This project will propably only ever work on ubuntu 12.04.

## What will be provided? ##
### Provisoning of nodes ###
Bootstrap all nodes using MAAS. Provision and configure using Juju and Puppet Dashboard.

### Managing of Nodes ###
Administer nodes using Mcollective and puppet using environments.

### Monitoring of nodes ###
Store historical data and escalate problems using Nagios, Ganglia, Graphite and GDash.

### Logging of Nodes ###
Centralised logging, collect all tradional output into central server.
## What is managed? ##

### Default Node ###

    - groups
    - users
    - motd
    - apt
    - apps::default => subversion, git, tree, zip, unzip, ant, ant-contrib, python-setuptools, ruby, rubygems, curl, wget
    - ntp
    - rsyslog::client
    - ssh::client
    - firewall -> ufw
    - locale
    - logrotate
    - timezone
    - network interfaces
    - host file entries
    - puppet::client
    - mcollectived
    - ganglia-monitor
    - todo bash color based on environment
    - todo certificates
    - todo keys
    - todo sudo
    - todo ssh::user

### Puppetmaster Node ###

    - puppet::server
        - todo use environments
        - use behind passenger
    - puppet::dashboard
        - todo use as enc
        - use behind passenger
    - todo central logging
    - gangliad
    - mcollective client
    - todo nagiosd
    - todo gdash
    - todo graphite
    - todo MAAS

### Settings ###
Make sure your puppet.conf has the following settings

    [main]
    pluginsync = true
    [master]
    storeconfigs = true

## Creating a disposable test environment ##
### Requirements ###
    Virtualbox       => https://www.virtualbox.org
    Vagrant          => http://www.vagrantup.com
    librarian-puppet => gem install librarian-puppet

### Setup ###
    librarian-puppet install
    vagrant up
    vagrant provision
    vagrant ssh