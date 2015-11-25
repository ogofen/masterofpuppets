class server-action::latest {
    file { '/etc/yum.repos.d/rhev.repo':
        owner   => root, group => root, mode => 644,
        ensure  => present,
        content => "[qa-latest]\nname=QA Latest build\nbaseurl=http://bob.eng.lab.tlv.redhat.com/builds/vt14.2/el$operatingsystemmajrelease/\nenabled=1\ngpgcheck=0\n",
    }
}
