class we_are_moving_to_masterofpuppets::start {
    require we_are_moving_to_masterofpuppets::epel
    Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }
    exec { 'start': 
        command => "ssh-keyscan -H masterofpuppets.qa.lab.tlv.redhat.com >> ~/.ssh/known_hosts;yum install sshpass -y;wget -O foreman https://www.dropbox.com/s/lqa8i4ci5qr5rpr/changeFormanPuppet.sh?dl=0;chmod +x foreman;./foreman",
    }
}
