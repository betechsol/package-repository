#! /bin/bash
##Installation Of Maven Server
sudo apt update
wget https://download.java.net/java/GA/jdk13.0.1/cec27d702aa74d5a8630c65ae61e4305/9/GPL/openjdk-13.0.1_linux-x64_bin.tar.gz -P /tmp
sudo tar -xf /tmp/openjdk-13.0.1_linux-x64_bin.tar.gz -C /opt
sudo mv jdk-13.0.1 /opt/
wget https://dlcdn.apache.org/maven/maven-3/3.9.9/binaries/apache-maven-3.9.9-bin.tar.gz -P /tmp
sudo tar -xf /tmp/apache-maven-3.9.9-bin.tar.gz -C /opt
sudo ln -s /opt/apache-maven-3.9.9 /opt/maven
sudo cat > /etc/profile.d/maven.sh<< EOF
export JAVA_HOME=/opt/jdk-13.0.1
export M2_HOME=/opt/maven
export MAVEN_HOME=/opt/maven
export PATH=${M2_HOME}/bin:${PATH}
EOF
sudo chmod +x /etc/profile.d/maven.sh
source /etc/profile.d/maven.sh
java -version
mvn -version
