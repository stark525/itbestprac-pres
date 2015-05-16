#!/bin/sh


# Download puppet rpm from official puppetlabs website
sudo rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-6.noarch.rpm

# Install puppet server (master)
yum -y install puppet-server-3.7.2-1.el6

# Set up development puppet master to autosign certificates
echo '*' > /etc/puppet/autosign.conf

# Allow traffic over 8140 for puppet master
iptables -I INPUT 1 -p tcp -m state --state NEW -m tcp --dport 8140 -j ACCEPT
service iptables save
service iptables restart

# Create hosts entries for master and node
echo "10.1.1.10 master.dev.com master" >> /etc/hosts
echo "10.10.10.10 test-win7.dev.com test-win7" >> /etc/hosts

# Start puppet master service
service puppetmaster start
echo 'Your puppet master has been configured. Auto-signing of certs is enabled.'
