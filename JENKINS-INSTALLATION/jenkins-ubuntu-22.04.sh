#! /bin/bash
## Jenkins Installation
sudo apt update
sudo apt install openjdk-17-jdk -y
java -version
##Importing the GPG key. The GPG key verifies package integrity
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
##Add the Jenkins software repository to the source list
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
/etc/apt/sources.list.d/jenkins.list > /dev/null
##Update the system repository one more time.
##Updating refreshes the cache and makes the system aware of the new Jenkins repository.
sudo apt update
##Install Jenkins by running
sudo apt install jenkins -y
##Check if Jenkins is installed and running
sudo systemctl status jenkins
##Get the default Jenkins unlock password
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
