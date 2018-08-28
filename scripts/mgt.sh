sudo su

echo "Installing Mgt utils"

yum install -y ansible python-pip vpnc #python2-winrm
#yum -y install python-devel krb5-devel krb5-libs krb5-workstation
#yum -y install python-devel krb5-devel krb5-libs krb5-workstation python-requests-kerberos
#yum -y install realmd samba samba-common oddjob oddjob-mkhomedir sssd ntpdate ntp
pip install --upgrade pip
pip install pywinrm

sed -i 's/#host_key_checking = False/host_key_checking = False/g' /etc/ansible/ansible.cfg

echo Downloading the lated verison of terraform
tfver=$(curl https://releases.hashicorp.com/terraform/ | grep terraform | egrep -v 'beta|rc' | egrep -o '[0-9].[0-9][0-9].[0-9]' | head -n 1)
wget 'https://releases.hashicorp.com/terraform/'$tfver'/terraform_'$tfver'_linux_amd64.zip'
unzip 'terraform_'$tfver'_linux_amd64.zip'
mv terraform /usr/bin
rm -f terraform*.zip

echo Downloading the latest verion of packer
packver=$(curl https://releases.hashicorp.com/packer/ | grep packer | egrep -v 'beta|rc' | egrep -o '[0-9].[0-9].[0-9]' | head -n 1)
wget 'https://releases.hashicorp.com/packer/'$packver'/packer_'$packver'_linux_amd64.zip'
unzip 'packer_'$packver'_linux_amd64.zip'
mv -f packer /usr/sbin/packer
rm -f packer*.zip

cp /vagrant/Vagrant/cert/*.pem ~
chmod 400 ~/*.pem

echo "Mgt box provisioned"   