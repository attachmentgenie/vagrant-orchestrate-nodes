[![Build Status](https://secure.travis-ci.org/attachmentgenie/vagrant-orchestrate-nodes.png)](http://travis-ci.org/attachmentgenie/vagrant-orchestrate-nodes)

# Creating a disposable test environment


## Requirements
    Virtualbox       => https://www.virtualbox.org
    Vagrant          => http://www.vagrantup.com
    librarian-puppet => gem install librarian-puppet

## Setup
    librarian-puppet install
    git submodule update --init
    vagrant up
    vagrant provision
    vagrant ssh
    
## Interfaces

### the foreman

https://puppet.testlab.vagrant

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

### Haproxy
http://proxy1.testlab.vagrant/haproxy_stats
