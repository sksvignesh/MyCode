#!/bin/bash

if [ -f /etc/redhat-release ] ;
then
export OS="Redhat" ;
elif [ -f /usr/bin/lsb_release ];
then
lsb_release -a | grep -q Ubuntu && OS="Debian" ;
lsb_release -a | grep -q Debian && OS="Debian" ;
elif [ -f /etc/issue ];
then
grep -q SUSE /etc/issue && OS="SUSE" ;
grep -q Debian /etc/issue && OS="Debian" ;
fi ;

export KERNEL=`uname -r |cut -c1`
export VER=`uname -r | sed 's/^.*\(el[0-9]\+\).*$/\1/' | grep -o [[:digit:]]*\$`

if  [ "$OS" = "Redhat" ] && [ $VER = "6" ] ; then
     rpm -Uvh /tmp/splunkforwarder-8.2.9-4a20fb65aa78-linux-2.6-x86_64.rpm;
     /opt/splunkforwarder/bin/splunk start --accept-license --answer-yes --auto-ports --no-prompt --seed-passwd PrN3^w1R3^plunk
     sleep 5;
elif [ "$OS" = "Redhat" ] && [ $VER = "7" ] ; then
     rpm -Uvh /tmp/splunkforwarder-9.0.4-de405f4a7979-linux-2.6-x86_64.rpm;
     /opt/splunkforwarder/bin/splunk start --accept-license --answer-yes --auto-ports --no-prompt --seed-passwd PrN3^w1R3^plunk
     sleep 5;

elif [ "$OS" = "Debian" ] && [ $KERNEL = "3" ] ; then
     dpkg -i /tmp/splunkforwarder-8.2.7.1-c2b65bc24aea-linux-2.6-amd64.deb
     /opt/splunkforwarder/bin/splunk stop
     /opt/splunkforwarder/bin/splunk start --accept-license --answer-yes --auto-ports --no-prompt --seed-passwd PrN3^w1R3^plunk
     sleep 5;
elif [ "$OS" = "Debian" ] && [ $KERNEL = "4" ] ; then
     dpkg -i /tmp/splunkforwarder-9.0.4-de405f4a7979-linux-2.6-amd64.deb
     /opt/splunkforwarder/bin/splunk stop
     /opt/splunkforwarder/bin/splunk start --accept-license --answer-yes --auto-ports --no-prompt --seed-passwd PrN3^w1R3^plunk
     sleep 5;
elif [ "$OS" = "Debian" ] && [ $KERNEL = "5" ] ; then
     dpkg -i /tmp/splunkforwarder-9.0.4-de405f4a7979-linux-2.6-amd64.deb
     /opt/splunkforwarder/bin/splunk start --accept-license --answer-yes --auto-ports --no-prompt --seed-passwd PrN3^w1R3^plunk
     sleep 5;
elif [ "$OS" = "SUSE" ] && [ $KERNEL == "2" ] ; then
     zypper  -in /tmp/splunkforwarder-8.2.9-4a20fb65aa78-linux-2.6-x86_64.rpm;
     /opt/splunkforwarder/bin/splunk start --accept-license --answer-yes --auto-ports --no-prompt --seed-passwd PrN3^w1R3^plunk
     sleep 5;
fi
