class vdsm::monitor {
    require vdsm::packages
    file { '/root/.monitor':
	  	owner => root, group => root, mode => 'a+wxr' ,
      ensure => present,
      source => 'puppet:///modules/vdsm/.monitor',
    }
    file { '/opt/logstash.conf':
		  owner => logstash, group => logstash, mode => 'a+wxr' ,
      ensure => present,
      source => 'puppet:///modules/vdsm/logstash.conf',
    }
    file { '/usr/bin/logstash':
		  owner => root, group => root, mode =>  'a+wxr',
      ensure => present,
      source => 'puppet:///modules/vdsm/logstash',
    }
}
