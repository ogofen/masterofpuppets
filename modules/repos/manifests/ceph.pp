class repos::ceph {
# function call with lambda:
  if ceph=="true" {
  $reps = ["Server-RH7-CEPH-MON-1.3.repo", "Server-RH7-CEPH-OSD-1.3.repo", "Server-RH7-CEPH-TOOLS-1.3.repo", "Workstation-RH7-CEPH-TOOLS-1.3.repo", "Server-RH7-CEPH-CALAMARI-1.3.repo", "/Server-RH7-CEPH-INSTALLER-1.3.repo"]
  each($reps) |$repo|{
    file {"/etc/yum.repos.d/$repo":
        owner => root, group => root, mode =>  'a+wr',
        ensure => present,
        source => "puppet:///modules/repos/ceph/$repo",
    }
  }
  }
}
