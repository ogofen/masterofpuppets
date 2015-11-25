class engine::tools {
    package { 'gcc-c++':
        ensure => installed,
    }
    package { 'gdb':
        ensure => installed,
    }
    package { 'gcc':
        ensure => installed,
    }
	file { '/root/log.vim':
		owner => root, group => root, mode => 644,
        ensure => present,
        source => '/root/engine-tools/log.vim',
    }
    file { '/root/.config/autostart/logstash':
      owner => root, group => root, mode => 644,
      ensure => present,
      source => 'puppet:///modules/server-utils/logstash'
    }
	file { '/root/.monitor':
		owner => root, group => root, mode => 647,
        ensure => present,
        source => '/root/engine-tools/.monitor',
    }
    file { '/root/Py_Sdk_Qe/sdk_connect.py':
		owner => root, group => root, mode => 755,
        ensure => present,
        content => template('engine/sdk_connect.erb'),
	}
    file { '/usr/bin/logstash':
		owner => root, group => root, mode => 777,
        ensure => present,
        source => 'puppet:///modules/vdsm/logstash',
    }
    file { '/opt/logstash.conf':
		owner => logstash, group => logstash, mode => 647,
        ensure => present,
        source => 'puppet:///modules/engine/logstash.conf',
    }
}
