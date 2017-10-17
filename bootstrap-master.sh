#!/bin/bash

# Run on VM to bootstrap Puppet Master 4.0 server

# Install Puppet Master
wget https://apt.puppetlabs.com/puppet5-release-xenial.deb
sudo gpg --keyserver pgp.mit.edu --recv-key 7F438280EF8D349F
sudo dpkg -i puppet5-release-xenial.deb
sudo apt update -yq
sudo apt-get install puppetserver -yq

# setup autosign for our nodes
echo "*.example.com" | sudo tee /etc/puppetlabs/puppet/autosign.conf 

# open the FW port 8140
sudo ufw allow 8140

# start and enable puppet
sudo systemctl start puppetserver
sudo systemctl enable puppetserver 
sudo systemctl status puppetserver
exit 0
