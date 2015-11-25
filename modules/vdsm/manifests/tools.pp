class vdsm::tools {
    package { 'zsh':
        ensure => installed,
    }
    file { '/root/isCleanUpNeeded.sh':
    		owner => root, group => root, mode => 755,
        ensure => present,
        source => 'puppet:///modules/server-action/isCleanUpNeeded.sh',
	}
    file { '/usr/bin/getAllVolumesInfo':
	    	owner => root, group => root, mode => 755,
        ensure => present,
        source => 'puppet:///modules/vdsm/getAllVolumesInfo',
	}
    file { '/usr/bin/getAllDomainsInfo':
	    	owner => root, group => root, mode => 755,
        ensure => present,
        source => 'puppet:///modules/vdsm/getAllDomainsInfo',
	}
    file { '/usr/bin/getAllDataVolumesInfo':
	    	owner => root, group => root, mode => 755,
        ensure => present,
        source => 'puppet:///modules/vdsm/getAllDataVolumesInfo',
	}
}
