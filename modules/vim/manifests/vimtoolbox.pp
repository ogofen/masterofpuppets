class vim::vimtoolbox {
    package { 'ctags':
      ensure => installed,
      allow_virtual => false,
    }
	file { '/root/.vimrc':
    owner => root, group => root, mode => 0644,
          ensure => present,
          source => 'puppet:///modules/vim/vimrc'
	}
	file { '/root/.vim/autoload/pathogen.vim':
		owner => root, group => root, mode => 0644,
          ensure => present,
          source => 'puppet:///modules/vim/pathogen.vim'
  }
  file { "/root/.vim/bundle":
    ensure => "directory",
  }
	file { '/root/.vim/bundle/Vundle.vim':
		owner => root, group => root, mode => 0644,
          ensure => present,
          source => 'puppet:///modules/vim/Vundle.vim',
          recurse => true
  }
}
