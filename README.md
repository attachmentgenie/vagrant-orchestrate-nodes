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

http://orchestrate1.testlab.vagrant

### rundeck

http://orchestrate1.testlab.vagrant:4440

### puppetdb

http://puppet.testlab.vagrant:8080

### rundeck_puppetdb

http://puppet.testlab.vagrant:4567

### icinga
http://monitor1.testlab.vagrant/icinga

### jenkins
http://ci1.testlab.vagrant:8080

### Haproxy
http://proxy1.testlab.vagrant/haproxy_stats
