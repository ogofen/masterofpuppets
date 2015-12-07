class repos::essentials {
   	file { "/etc/yum.repos.d/rhel-mop.repo":
      owner => root, group => root, mode =>  'a+wr',
      ensure => present,
      source => "puppet:///modules/repos/rhel-$operatingsystemrelease-repos/rhel-mop.repo",
    }
}
