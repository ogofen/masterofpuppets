class server_utils::packages {
    package { 'xorg-x11-xauth':
        ensure => installed,
        allow_virtual => false,
    }
    package { 'java-1.8.0-openjdk':
        ensure => installed,
        allow_virtual => false,
    }
    package { 'ncurses':
        ensure => installed,
        allow_virtual => false,
    }
    package { 'htop':
        ensure => installed,
        allow_virtual => false,
    }
    package { 'chrony':
        ensure => installed,
        allow_virtual => false,
    }
    cron { 'puppet-agent':   
       command => "/usr/bin/puppet agent -t",   
       user    => root,
       hour    => '*',   
       minute  => '*/45',
    }
    if $ceph=="true" {
      package {["ceph-osd", "ceph-mon", "ceph-radosgw", "ceph", "ceph-deploy"]:
        ensure => installed,
        allow_virtual => false,
      }
    }
}
