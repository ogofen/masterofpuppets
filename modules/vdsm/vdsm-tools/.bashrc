# .bashrc
OS=`gawk {'print $7'} /etc/redhat-release`
if [[ $OS > '6.6' ]]; then                                                                                                                 
   chkconfig NetworkManager off 2>/dev/null 1>&2                                      
fi    
chsh -s /bin/zsh root
# User specific aliases and functions
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi
alias less!="vim -u NONE -R /var/log/vdsm/vdsm.log -S /root/vdsm.vim '+set nonu' '+set wrap'"
# User specific aliases and functions
alias vi="vim"
alias monitor="/root/.monitor"
alias puppet-vdsm-clean='echo "1">cleanflag;puppet agent -t'
