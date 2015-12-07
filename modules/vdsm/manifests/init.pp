class vdsm {
    require repos
    include vdsm::packages
    include vdsm::tools
    include vdsm::initiator
    include vdsm::monitor
    include vdsm::actions
}
