sudo su
ln -sf  /usr/share/zoneinfo/Australia/Sydney /etc/localtime
yum update -y
yum install epel-release -y
yum install -y wget unzip telnet net-tools nmap bind-utils git #python-pip

sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
service sshd restart
