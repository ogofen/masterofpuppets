#/bin/bash
AUTH_KEYS=/root/.ssh/authorized_keys
ssh -lroot $1 "mkdir /root/.ssh" 2>/dev/null
scp $AUTH_KEYS root@$1:/$AUTH_KEYS
ssh -lroot $1 "hostnamectl set-hostname $1"
HAVE_PUPPET=`ssh -lroot $1 "rpm -qa | grep puppet| grep -v release"`
if [ -z $HAVE_PUPPET ];then
echo "no puppet"
ssh -lroot $1 "rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm"
ssh -lroot $1 "rpm -ivh http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm"
ssh -lroot $1 "yum-config-manager --add-repo http://download.lab.bos.redhat.com/rel-eng/RHEL-7.2-Beta-1.0/compose/Server/x86_64/os/"
ssh -lroot $1 "yum install puppet --nogpgcheck -y"
fi
puppet cert clean $1
sed s/NAME/$1/ tmp_puppet.conf>puppet.conf
scp puppet.conf root@$1:/etc/puppet/
SSLDIR=`ssh -lroot $1 "puppet config print all | grep ssldir | awk {'print $3'}"`
ssh -lroot $1 "service puppet stop && rm -rf $SSLDIR && puppet agent -t"
sleep 3
puppet cert sign $1
ssh -lroot $1 "rm /etc/yum.repos.d/*"
ssh -lroot $1 "puppet agent -t"
