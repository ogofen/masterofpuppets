class oh_my_zsh::oh_my_zsh {
    package { 'zsh':
        ensure => installed,
    }
   vcsrepo { '/root/oh-my-zsh':
        ensure   => present,
        provider => git,
        source   => "https://github.com/robbyrussell/oh-my-zsh.git",
    }
    file { '/root/.zshrc':
		owner => root, group => root, mode => 644,
        ensure => present,
        source => 'puppet:///modules/oh_my_zsh/zshrc'
	}
}
