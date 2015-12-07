class vdsm::actions {
    file { '/root/server_actions':
      owner => root, group => root, mode => 'o+w,a+r' ,
      ensure => present,
      source => 'puppet:///modules/server_action/vdsm-actions',
    }
    file { '/root/vdsm.vim':
      owner => root, group => root, mode => 'o+w,a+r' ,
      ensure => present,
      source => 'puppet:///modules/server_action/vdsm.vim',
    }
    file { '/root/.bashrc':
      owner => root, group => root, mode => 'o+x,a+rw' ,
      ensure => present,
      source => 'puppet:///modules/server_utils/bashrc',
    }
    file { '/root/do_while.sh':
		  owner => root, group => root, mode => 'o+x,a+rw' ,
      ensure => present,
      source => 'puppet:///modules/server_action/vdsm_do_while.sh',
    }
    file { '/root/less.sh':
		  owner => root, group => root, mode => 'o+x,a+rw' ,
      ensure => present,
      source => 'puppet:///modules/server_action/less.sh',
    }
}
