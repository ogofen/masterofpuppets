class repos::essentials {
   	file { '/etc/yum.repos.d/epel.repo':
		owner => root, group => root, mode => 0644,
        ensure => present,
        source => "puppet:///modules/repos/rhel-$operatingsystemrelease-repos/epel.repo",
	} 
   	file { '/etc/yum.repos.d/rhel-optional.repo':
		owner => root, group => root, mode => 0644,
        ensure => present,
        source => "puppet:///modules/repos/rhel-$operatingsystemrelease-repos/rhel-optional.repo",
	} 
   	file { '/etc/yum.repos.d/rhel-server.repo':
		owner => root, group => root, mode => 0644,
        ensure => present,
        source => "puppet:///modules/repos/rhel-$operatingsystemrelease-repos/rhel-server.repo",
	} 
   	file { '/etc/yum.repos.d/rhel-source.repo':
		owner => root, group => root, mode => 0644,
        ensure => present,
        source => "puppet:///modules/repos/rhel-$operatingsystemrelease-repos/rhel-source.repo",
	}
   	file { "/etc/yum.repos.d/rhel$operatingsystemmajrelease.repo":
		owner => root, group => root, mode => 0644,
        ensure => present,
        source => "puppet:///modules/repos/rhel-$operatingsystemrelease-repos/rhel$operatingsystemmajrelease.repo",
	}
 }
