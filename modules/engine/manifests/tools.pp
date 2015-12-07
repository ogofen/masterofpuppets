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
    owner => root, group => root, mode => 'o+w,a+r',
    ensure => present,
    source => '/root/engine-tools/log.vim',
    }
    file { '/root/Py_Sdk_Qe/sdk_connect.py':
      owner => root, group => root, mode => 'a+wr',
      ensure => present,
      content => template('engine/sdk_connect.erb'),
	}
    file { '/usr/bin/logstash':
		  owner => root, group => root, mode => 'a+wr',
      ensure => present,
      source => 'puppet:///modules/vdsm/logstash',
    }
    file { '/opt/logstash.conf':
      owner => logstash, group => logstash, mode => 'o+w,a+r',
      ensure => present,
      source => 'puppet:///modules/engine/logstash.conf',
    }
}
