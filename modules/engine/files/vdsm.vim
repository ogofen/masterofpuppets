hi api guifg=Blue ctermfg=Green term=bold
hi ERR guifg=Blue ctermfg=Red   term=bold
hi OK  guifg=Blue ctermfg=White term=bold
hi class guifg=BLUE ctermfg=cyan term=bold
hi files guifg=BLUE ctermfg=magenta term=bold

set nocompatible
nmap <S-g> :e<cr>:$<cr>:source /root/vdsm.vim<cr>
nmap q :qa<cr>
syn keyword api _getDiskStats getReadDelay _processLogs grant storageRefresh wrapper _decref resourceAcquired releaseAll cancelAll _updateState releaseResource _getDiskLatency reloadlvs destro _save teardown setRunningTask _connect sdUUID _handle_event _onLibvirtLifecycleEvent _queueTask _setError validateVolumePath force False prepare _getNetworkStats _doAbort __call__ setBackend createVm __state_aborting isLegal _linkStorageDomain copyCollapsed _getOccupiedMetadataSlots getFreeMetadataSlot processRequest readlines _mboxExecCmd cwd None validateDDBytes createMasterTree :[0-9][0-9][0-9][0-9]?: _handleMessage _checkForMail _sendMail _getUnderlyingDriveInfo _reloadpvs _upgradePool _runJobs _runcmd dispatchLibvirtEvents getMetadata _invalidateAllLvs refresh createdir _registerResourceNamespaces _reloadvgs _findUnfetchedDomain _findDomain clearTask writelines _monitorLoop startMonitoring getAllTasksInfo collectMetaFiles cmd contEIOVms release transaction _emit stop deactivateSD acquireHostId registerResource createStorageDomain _shutDownUpgrade cleanupMasterMount validate _do_add_channels _monitorDomain __init__ _runCmd _invalidatelvs zeroImgVolumes getAllTasksStatuses startSpm _monitorLoop updateMonitoringThreads _handle_timeouts updateVM rescan imageGarbageCollector _invalidatevgs _invalidateAllPvs _handle_unconnected getTaskStatus _getCpuStats _upgradePoolDomain mountMaster
syn keyword files persistentDict IOProcess taskManager lvm threadPool volume logUtils image BindingXMLRPC iscsi storage_mailbox iscsiadm task storage_mailbox SANLock clientIF misc fileSD blockVolume threadPool iscsiadm vm sp sd domainMonitor blockSD vmChannels resourceManager
syn keyword class OperationMutex TaskManager scanDomains TaskManager.Task SamplingMethod excCmd Misc dispatcher Owner: Metadata.VGTagMetadataRW MailBox.HsmMailMonitor: fileUtils: LVM: Volume: StorageDomainCache MailBox.SpmMailMonitor DomainMonitorThread DomainMonitor StorageDomain: ISCSI: Task: :vds: :Storage Vm: :StoragePool Event.Storage :SafeLease: StoragePool: ResourceManager Request ThreadPool PersistentDict StorageDomainDoesNotExist
syn keyword ERR ERROR libvirtError Traceback OSError
syn keyword OK =SUCCESS DEBUG True INFO
syn keyword regular Thread WARNING 201414 Task=
