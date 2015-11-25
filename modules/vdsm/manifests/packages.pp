class vdsm::packages {
    vcsrepo { '/root/vdsm-tools':
        ensure   => present,
        provider => git,
        source   => "https://github.com/ogofen/vdsm-tools.git",
        require  => Class['server-utils'],
    }
    package { 'iscsi-initiator-utils':
        ensure => installed,
    }
}
