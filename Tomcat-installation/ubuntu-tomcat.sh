#! /bin/bash

sudo apt update
cd /tmp
sudo wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.105/bin/apache-tomcat-9.0.105.tar.gz
/opt/tomcat
sudo tar xzvf /tmp/apache-tomcat-9.0.105.tar.gz -C /opt/tomcat --strip-components=
sudo tar xzvf /tmp/apache-tomcat-9.0.105.tar.gz -C /opt/tomcat --strip-components=1
sudo chgrp -R tomcat /opt/tomcat
sudo chmod -R g+r conf
sudo chmod g+x conf
sudo chown -R tomcat webapps/ work/ temp/ logs/
