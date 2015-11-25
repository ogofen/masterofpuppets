class engine::action {
    require engine::tools
    file { '/root/config.setup':
	  	owner => root, group => root, mode => 644,
      ensure => present,
      content => template('server-action/config.erb'),
    }
    file { '/root/cleanup.conf':
		  owner => root, group => root, mode => 644,
      ensure => present,
      content => template('server-action/cleanup.erb'),
    }
    file { '/root/isSetupNeeded.sh':
		  owner => root, group => root, mode => 755,
      ensure => present,
      source => 'puppet:///modules/server-action/isSetupNeeded.sh',
    }
    file { '/root/server-actions':
		  owner => root, group => root, mode => 755,
      ensure => present,
      source => 'puppet:///modules/server-action/engine-actions',
    }
    file { '/root/.bashrc':
      owner => root, group => root, mode => 644,
      ensure => present,
      source => 'puppet:///modules/server-utils/bashrc'
    }
    file { '/root/do_while.sh':
		  owner => root, group => root, mode => 755,
      ensure => present,
      source => 'puppet:///modules/server-action/do_while.sh',
    }
    file { '/root/setupflag':
		  owner => root, group => root, mode => 755,
      ensure => absent,
    }
    file { '/root/less.sh':
		  owner => root, group => root, mode => 755,
      ensure => present,
      source => 'puppet:///modules/server-action/less.sh',
    }
}
