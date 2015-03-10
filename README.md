[![Build Status](https://secure.travis-ci.org/attachmentgenie/vagrant-orchestrate-nodes.png)](http://travis-ci.org/attachmentgenie/vagrant-orchestrate-nodes)

# Setting up your nodes #

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