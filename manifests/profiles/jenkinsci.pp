class profiles::jenkinsci {

  class { 'jenkins':
    configure_firewall => false,
  }

  $jenkinsPlugins = ['analysis-core',
                     'build-flow-plugin',
                     'build-flow-extensions-plugin',
                     'build-name-setter',
                     'buildgraph-view',
                     'buildtriggerbadge',
                     'claim',
                     'dashboard-view',
                     'conditional-buildstep',
                     'config-file-provider',
                     'email-ext',
                     'greenballs',
                     'jobConfigHistory',
                     'mailer',
                     'parameterized-trigger',
                     'promoted-builds',
                     'rebuild',
                     'run-condition',
                     'show-build-parameters',
                     'ssh',
                     'token-macro']
  jenkins::plugin {
    $jenkinsPlugins: ;
  }
  classes::accessrule { '999 accept 8080':
    port => 8080,
  }
  motd::register{ 'Module : jenkins': }
}