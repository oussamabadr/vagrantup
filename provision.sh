#!/bin/bash
export DEBIAN_FRONTEND=noninteractive

apt-get update -y
DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" dist-upgrade

echo Installing VirtualBox Guest Additions.....
apt-get install -y dkms build-essential linux-headers-generic
echo Installing VirtualBox Guest Additions.....Done

echo Setup keyboard layout....
locale-gen fr_FR.UTF-8
locale-gen fr_FR
localectl set-keymap fr
echo setxkbmap fr >> .bashrc
echo Setup keyboard layout....Done

echo installing utilities..........
apt-get install -y nano
apt-get install -y geditge
apt-get install -y qpdfview
apt-get install -y diodon
apt-get install -y git
apt-get install -y chromium-browser
apt-get install -y firefox
apt-get install -y snapd
echo installing utilities..........DONE

mkdir /home/Documents/tools

echo Installing Apache Maven...
cd /home/vagrant/Documents/tools
wget -0 apache-maven-3.6.3-bin.tar.gz http://mirrors.ircam.fr/pub/apache/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz
tar -xvf apache-maven-3.6.3-bin.tar.gz
echo "" | sudo tee -a /etc/profile
echo export MAVEN_HOME=/home/vagrant/Documents/tools/apache-maven-3.6.3-bin | sudo tee -a /etc/profile
source /etc/profile
echo export PATH=$MAVEN_HOME/bin:$PATH | sudo tee -a /etc/profile
cd ~
echo Installing Apache Maven...Done

echo installing intellij-idea-community.....
#snap install intellij-idea-community --classic
cp -r /vagrant/.IdeaIC2019.3 ~
echo installing intellij-idea-community.....Done

echo Installing Visual Code.....
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EB3E94ADBE1229CF
sudo add-apt-repository -y "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt-get -y install code
echo Installing Visual Code.....Done

echo Installing Open JDK 11....
apt-get install -y openjdk-11-jdk

echo "" | sudo tee -a /etc/profile
echo export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64 | sudo tee -a /etc/profile
echo export PATH=$JAVA_HOME/bin:$PATH | sudo tee -a /etc/profile
echo Installing Open JDK 11...Done

echo installing dbeaver-ce.....
snap install dbeaver-ce
echo installing dbeaver-ce.....Done

echo install Soapui.....
wget -0 /home/vagrant/Documents/tools/SoapUI-x64-5.5.0.sh https://s3.amazonaws.com/downloads.eviware/soapuios/5.5.0/SoapUI-x64-5.5.0.sh -q --show-progress
chmod +x /home/vagrant/Documents/tools/SoapUI-x64-5.5.0.sh
./home/vagrant/Documents/tools/SoapUI-x64-5.5.0.sh -q
echo install Soapui.....Done

echo Installing docker-ce....
apt install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
apt-get install -y docker-ce=5:19.03.6~3-0~ubuntu-bionic
echo Installing docker-ce...done

echo Getting oracle-xe-11g docker image
docker pull wnameless/oracle-xe-11g-r2
echo Getting oracle-xe-11g docker image...done

echo Getting Postgre DB docker image.....
docker pull postgres:12.2
echo Getting Postgre DB docker image.....Done

echo Installing Dev environment...........DONE

echo Provisioning......OK
echo ""
echo Reboot in progress

reboot