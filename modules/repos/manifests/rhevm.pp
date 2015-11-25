class repos::rhevm {
   $path="http://bob.eng.lab.tlv.redhat.com/builds/3.6/3.6.0-20/rhev-release-3.6.0-20-001.noarch.rpm"
    $rhev_release="rhev-release-3.6.0-20-001"
    if $engine==rhevm {
    exec { "yum install ovirt-master":
        command => "/usr/bin/yum install -y $path",
        unless => "/bin/rpm -qa | /bin/grep $rhev_release",
        }
    }
    if $engine==ovirt {
    exec { "yum install ovirt-master":
        command => "/usr/bin/yum install -y  http://resources.ovirt.org/pub/ovirt-3.6-pre/rpm/el7Server/noarch/ovirt-release-master-001-0.10.master.noarch.rpm" ,
        unless => "/bin/rpm -qa | /bin/grep ovirt-release-master",
        }
    }
}
