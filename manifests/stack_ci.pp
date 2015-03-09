class stack_ci {

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
                     'cloudbees-folder',
                     'cloverphp',
                     'conditional-buildstep',
                     'config-file-provider',
                     'crap4j',
                     'credentials',
                     'cron_column',
                     'dashboard-view',
                     'dry',
                     'email-ext',
                     'embeddable-build-status',
                     'envinject',
                     'git',
                     'git-client',
                     'gravatar',
                     'greenballs',
                     'htmlpublisher',
                     'ivy',
                     'javadoc',
                     'jdepend',
                     'jobConfigHistory',
                     'mailer',
                     'mapdb-api',
                     'maven-plugin',
                     'multiple-scms',
                     'next-build-number',
                     'parameterized-trigger',
                     'plot',
                     'plugin-usage-plugin',
                     'pmd',
                     'project-stats-plugin',
                     'promoted-builds',
                     'publish-over-ssh',
                     'rebuild',
                     'run-condition',
                     'rundeck',
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
#  classes::accessrule { '999 accept 8080':
#    port => 8080,
#  }

  motd::register{ 'Stack : jenkins': }
}
