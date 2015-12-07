class engine::git_utils {
    package { 'git':
        ensure => installed,
        allow_virtual => false,
    }
    vcsrepo { '/root/Py_Sdk_Qe':
        ensure   => present,
        provider => git,
        source   => "https://github.com/ogofen/Py_Sdk_Qe.git",
    }
    vcsrepo { '/root/engine-tools':
        ensure   => present,
        provider => git,
        source   => "https://github.com/ogofen/engine-tools.git",
        require  => Package['git'],
        before   => File['/root/log.vim'],
    }
    vcsrepo { '/root/Rest-Api-Qe':
        ensure   => present,
        provider => git,
        source   => "https://github.com/ogofen/Rest-Api-Qe.git",
        require  => Package['git'],
        before   => File['/root/log.vim'],
    }
}
