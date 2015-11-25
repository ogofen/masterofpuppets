class we_are_moving_to_masterofpuppets::epel {
    file { '/etc/yum.repos.d/epel.repo':
		owner => root, group => root, mode => 755,
        ensure => present,
        source => 'puppet:///modules/we_are_moving_to_masterofpuppets/epel.repo',
	}
}
