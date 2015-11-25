class server-utils::packages {
    package { 'xorg-x11-xauth':
        ensure => installed,
        allow_virtual => false,
    }
    exec { "yum install logstash":
        command => "/usr/bin/yum install -y http://download.elastic.co/logstash/logstash/packages/centos/logstash-1.5.4-1.noarch.rpm",
        unless => "/bin/rpm -qa | /bin/grep logstash",
    }
    file { '/etc/chrony.conf':
		  owner => root, group => root, mode => 777,
      ensure => present,
      source => 'puppet:///modules/server-utils/chrony.conf',
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
      package {["ceph-osd", "ceph-mds", "ceph-mon", "ceph-radosgw", "ceph", "ceph-deploy"]:
        ensure => installed,
        allow_virtual => false,
      }
    }
}
