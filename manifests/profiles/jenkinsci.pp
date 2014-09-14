class profiles::jenkinsci {

  class { 'jenkins':
    version            => 'latest',
    configure_firewall => false,
  }

  $jenkinsPlugins = ['analysis-core',
                     'ant',
                     'build-flow-plugin',
                     'build-flow-extensions-plugin',
                     'build-name-setter',
                     'buildgraph-view',
                     'buildtriggerbadge',
                     'claim',
                     'cloverphp',
                     'conditional-buildstep',
                     'config-file-provider',
                     'crap4j',
                     'credentials',
                     'dashboard-view',
                     'dry',
                     'email-ext',
                     'git',
                     'git-client',
                     'greenballs',
                     'htmlpublisher',
                     'javadoc',
                     'jdepend',
                     'jobConfigHistory',
                     'mailer',
                     'mapdb-api',
                     'maven-plugin',
                     'multiple-scms',
                     'parameterized-trigger',
                     'plot',
                     'pmd',
                     'promoted-builds',
                     'rebuild',
                     'run-condition',
                     'show-build-parameters',
                     'scm-api',
                     'ssh',
                     'ssh-credentials',
                     'subversion',
                     'token-macro',
                     'violations',
                     'xunit']
  jenkins::plugin {
    $jenkinsPlugins: ;
  }
  classes::accessrule { '999 accept 8080':
    port => 8080,
  }

  motd::register{ 'Profile : jenkins': }
}