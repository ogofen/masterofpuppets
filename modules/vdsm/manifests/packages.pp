class vdsm::packages {
    vcsrepo { '/root/vdsm-tools':
        ensure   => present,
        provider => git,
        source   => "https://github.com/ogofen/vdsm-tools.git",
    }
    package { 'iscsi-initiator-utils':
        ensure => installed,
        allow_virtual => false,
    }
    yumrepo { "logstash":
      baseurl => "http://packages.elastic.co/logstash/2.1/centos",
      enabled => 1,
      gpgcheck => 0,
    }
    package { 'logstash':
      ensure => installed,
      allow_virtual => false,
    }
}
