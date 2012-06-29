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

    -
    - groups
    - users
    - motd
    - apt
    - apps::default => subversion, git, tree, zip, unzip, ant, ant-contrib, python-setuptools, ruby, rubygems
    - ntp
    - rsyslog::client
    - ssh::client
    - ufw
    - todo bash color based on environment
    - todo certificates
    - todo ganglia-monitor
    - todo Hosts
    - todo interfaces
    - todo keys
    - todo mcollectived
    - todo puppet::client

### Puppetmaster Node ###

    - apps::provision => juju
    - todo central logging
    - todo gangliad
    - todo MAAS (dhcp, dns, apt repositories?, ntp?)
    - todo nagiosd
    - todo puppet::server
        - todo use environments
    - todo puppet::dashboard
        - todo use as enc
    - todo gdash
    - todo graphite

### Settings ###
Make sure your puppet.conf has the following settings

    [main]
    pluginsync = true
    [master]
    storeconfigs = true

## Creating a disposable test environment ##
### Requirements ###
    Virtualbox => https://www.virtualbox.org
    Vagrant    => http://www.vagrantup.com

### Setup ###
    vagrant up
    vagrant provision