class server-action::libgfapi {
    file { '/etc/yum.repos.d/rhev.repo':
        owner   => root, group => root, mode => 644,
        ensure  => present,
        content => "[qa-latest]\nname=QA Latest build\nbaseurl=http://brewweb.devel.redhat.com/brew/taskinfo?taskID=8505879\nenabled=1\ngpgcheck=0\n",
    }
}
