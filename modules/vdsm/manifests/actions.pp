class server-action::hypervisor::standart {
    file { '/root/server-actions':
      owner => root, group => root, mode => 755,
      ensure => present,
      source => 'puppet:///modules/server-action/vdsm-actions',
    }
    file { '/root/vdsm.vim':
      owner => root, group => root, mode => 755,
      ensure => present,
      source => 'puppet:///modules/server-action/vdsm.vim',
    }
    file { '/root/.bashrc':
      owner => root, group => root, mode => 755,
      ensure => present,
      source => 'puppet:///modules/server-utils/bashrc',
    }
    file { '/root/do_while.sh':
		  owner => root, group => root, mode => 755,
      ensure => present,
      source => 'puppet:///modules/server-action/vdsm_do_while.sh',
    }
    file { '/root/less.sh':
		  owner => root, group => root, mode => 755,
      ensure => present,
      source => 'puppet:///modules/server-action/less.sh',
    }
}
