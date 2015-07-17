[![Build Status](https://secure.travis-ci.org/attachmentgenie/vagrant-orchestrate-nodes.png)](http://travis-ci.org/attachmentgenie/vagrant-orchestrate-nodes)

# Creating a disposable test environment


## Requirements
    Virtualbox       => https://www.virtualbox.org
    Vagrant          => http://www.vagrantup.com

## Setup
    git submodule update --init
    vagrant up puppet
    
## Interfaces

### the foreman

https://puppet.testlab.vagrant
username : admin
password : secret

### puppetdb

http://puppet.testlab.vagrant:8080

### rundeck

http://orchestrate1.testlab.vagrant:4440

### rundeck_puppetdb

http://orchestrate1.testlab.vagrant:4567

### jenkins
http://orchestrate1.testlab.vagrant:8080

### icinga
http://monitor1.testlab.vagrant/icinga

### gitlab
http://repo1.testlab.vagrant:8081
username : root
password : 5iveL!fe

### Haproxy
http://proxy1.testlab.vagrant/haproxy_stats
