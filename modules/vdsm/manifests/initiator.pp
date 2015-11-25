class vdsm::initiator{
    require vdsm::packages
    file { '/etc/iscsi/initiatorname.iscsi':
		owner => root, group => root, mode => 644,
        ensure => present,
        content => "InitiatorName=iqn.1994-05.com.redhat:$hostname\n",
	}
}
