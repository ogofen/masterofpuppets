class server_utils::gits {
    package { 'git':
        ensure => installed,
        allow_virtual => false,
    }
}
