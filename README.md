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

### rundeck

http://192.168.21.130:4440

### puppetdb

http://192.168.21.130:8080

### rundeck_puppetdb

http://192.168.21.130:4567

### icinga
http://192.168.21.132/icinga

### jenkins
http://192.168.21.136:8080

### Haproxy
http://192.168.21.160/haproxy_stats
