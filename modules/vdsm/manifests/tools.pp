class vdsm::tools {
    package { 'zsh':
        ensure => installed,
        allow_virtual => false,
    }
    file { '/root/isCleanUpNeeded.sh':
    		owner => root, group => root, mode =>  'a+wxr',
        ensure => present,
        source => 'puppet:///modules/server_action/isCleanUpNeeded.sh',
	}
    file { '/usr/bin/getAllVolumesInfo':
	    	owner => root, group => root, mode =>  'a+wxr',
        ensure => present,
        source => 'puppet:///modules/vdsm/getAllVolumesInfo',
	}
    file { '/usr/bin/getAllDomainsInfo':
	    	owner => root, group => root, mode =>  'a+wxr',
        ensure => present,
        source => 'puppet:///modules/vdsm/getAllDomainsInfo',
	}
    file { '/usr/bin/getAllDataVolumesInfo':
	    	owner => root, group => root, mode =>  'a+wxr',
        ensure => present,
        source => 'puppet:///modules/vdsm/getAllDataVolumesInfo',
	}
}
