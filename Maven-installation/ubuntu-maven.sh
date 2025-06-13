#! /bin/bash
##Installation Of Maven Server
sudo apt update
wget https://download.oracle.com/java/17/archive/jdk-17.0.1_linux-x64_bin.tar.gz -P /tmp
sudo tar -xf /tmp/jdk-17.0.1_linux-x64_bin.tar.gz -C /opt
wget https://dlcdn.apache.org/maven/maven-3/3.9.10/binaries/apache-maven-3.9.10-bin.tar.gz -P /tmp
sudo tar -xf /tmp/apache-maven-3.9.10-bin.tar.gz -C /opt
sudo ln -s /opt/apache-maven-3.9.10 /opt/maven
sudo cat > /etc/profile.d/maven.sh<< EOF
export JAVA_HOME=/opt/jdk-17.0.1
export M2_HOME=/opt/maven
export MAVEN_HOME=/opt/maven
export PATH=${M2_HOME}/bin:${PATH}
export PATH
EOF
sudo chmod +x /etc/profile.d/maven.sh
source /etc/profile.d/maven.sh
java -version
mvn -version
