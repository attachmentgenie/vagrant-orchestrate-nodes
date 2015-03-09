class stack_gitlab (
  $external_url         = "http://${::fqdn}",
  $gitlab_branch        = '7.8.2',
  $gitlab_download_link = 'https://downloads-packages.s3.amazonaws.com/centos-6.6/gitlab-7.8.2_omnibus.1-1.el6.x86_64.rpm',
) {
  class { gitlab :
    external_url           => $external_url,
    gitlab_branch          => $gitlab_branch,
    gitlab_download_link   => $gitlab_download_link,
    puppet_manage_packages => false,
  }

  motd::register{ 'Stack : gitlab': }
}