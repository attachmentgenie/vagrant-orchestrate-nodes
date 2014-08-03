node default {

  notify{'default_node_inclusion':
    message => 'WARNING: you are including the default role. Make sure your fqdn reflects the nodes role!',
  }
}