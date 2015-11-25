class vdsm::monitor {
    require vdsm::packages
    file { '/root/.monitor':
	  	owner => root, group => root, mode => 647,
      ensure => present,
      source => 'puppet:///modules/vdsm/.monitor',
    }
    file { '/opt/logstash.conf':
		  owner => logstash, group => logstash, mode => 647,
      ensure => present,
      source => 'puppet:///modules/vdsm/logstash.conf',
    }
    file { '/usr/bin/logstash':
		  owner => root, group => root, mode => 777,
      ensure => present,
      source => 'puppet:///modules/vdsm/logstash',
    }
    file { '/root/.config/autostart/logstash':
      owner => root, group => root, mode => 644,
      ensure => present,
      source => 'puppet:///modules/server-utils/logstash'
    }
}
