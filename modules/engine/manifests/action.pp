class engine::action {
    require engine::tools
    file { '/root/config.setup':
	  	owner => root, group => root, mode => 'o+w,a+r',
      ensure => present,
      content => template('engine/config.erb'),
    }
    file { '/root/cleanup.conf':
		  owner => root, group => root, mode => 'o+w,a+r',
      ensure => present,
      content => template('engine/cleanup.erb'),
    }
    file { '/root/isSetupNeeded.sh':
		  owner => root, group => root, mode => 'a+rwx',
      ensure => present,
      source => 'puppet:///modules/engine/isSetupNeeded.sh',
    }
    file { '/root/server-actions':
		  owner => root, group => root, mode => 'a+rwx',
      ensure => present,
      source => 'puppet:///modules/engine/engine-actions',
    }
    file { '/root/.bashrc':
      owner => root, group => root, mode => 'o+w,a+r',
      ensure => present,
      source => 'puppet:///modules/server_utils/bashrc'
    }
    file { '/root/do_while.sh':
		  owner => root, group => root, mode => 'a+rwx',
      ensure => present,
      source => 'puppet:///modules/engine/do_while.sh',
    }
    file { '/root/setupflag':
		  owner => root, group => root, mode => 'a+rwx',
      ensure => absent,
    }
    file { '/root/less.sh':
		  owner => root, group => root, mode => 'a+rwx',
      ensure => present,
      source => 'puppet:///modules/engine/less.sh',
    }
}
