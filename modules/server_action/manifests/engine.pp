class server-action::engine::setup {
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
    cron { 'puppet-agemt':   
       command => "/usr/bin/puppet agent -t",   
       user    => root,
       hour    => '*',   
       minute  => '*/45',
    }
    file { '/root/server-actions':
		owner => root, group => root, mode => 755,
        ensure => present,
        source => 'puppet:///modules/server-action/engine-actions',
	}
    file { '/root/setupflag':
		owner => root, group => root, mode => 755,
        ensure => absent,
	}
}
