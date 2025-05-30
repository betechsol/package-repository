#!/bin/bash
# Install and start nexus as a service 
# This script works on RHEL 7 & 8 OS 
# Your server must have atleast 4GB of RAM
# become the root / admin user via: sudo su -
#1. Create nexus user to manage the nexus
# As a good security practice, Nexus is not advised to run nexus service as a root user, so create a new user called nexus and grant sudo access to manage nexus services as follows.
sudo useradd nexus
#4 Give sudo access to nexus user
sudo echo "nexus ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/nexus
sudo su - nexus
cd /opt


# 1.Install prerequisit: JAVA, git, unzip
sudo yum install wget git nano unzip -y
sudo yum install java-11-openjdk-devel java-1.8.0-openjdk-devel -y
# 2. Download nexus software and extract it (unzip)
sudo wget -O nexus.tar.gz https://download.sonatype.com/nexus/3/nexus-3.80.0-06-linux-x86_64.tar.gz
sudo tar -xvf nexus.tar.gz
sudo mv /opt/nexus-3* /opt/nexus
#5 Change the owner and group permissions to /opt/nexus and /opt/sonatype-work directories.
sudo chown -R nexus:nexus /opt/nexus
sudo chown -R nexus:nexus /opt/sonatype-work
sudo chmod -R 775 /opt/nexus
sudo chmod -R 775 /opt/sonatype-work
#6 Open /opt/nexus/bin/nexus.rc file and  uncomment run_as_user parameter and set as nexus user.
echo run_as_user="nexus" > /opt/nexus/bin/nexus.rc
#7 CONFIGURE NEXUS TO RUN AS A SERVICE
## Create file: sudo vi /etc/systemd/system/nexus.service
## Add Contents:
sudo cat > /etc/systemd/system/nexus.service<< EOF
[Unit]
Description=nexus service
After=network.target
  
[Service]
Type=forking
LimitNOFILE=65536
ExecStart=/opt/nexus/bin/nexus start
ExecStop=/opt/nexus/bin/nexus stop

User=nexus
Restart=on-abort
TimeoutSec=600
  
[Install]
WantedBy=multi-user.target
EOF

### Close save and quit

#9 Enable and start the nexus services
sudo systemctl daemon-reload
sudo systemctl enable nexus
sudo systemctl start nexus
sudo systemctl status nexus
echo "end of nexus installation"

## To view logs
tail -f /opt/sonatype-work/nexus3/log/nexus.log
