# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  config.vm.define "mgt" do |mgt|
	mgt.vm.provider  "virtualbox" do |vb|
      vb.memory = 2048
      vb.cpus = 2
    end
    mgt.ssh.username = "vagrant"
    #mgt.landrush.enabled = true
    mgt.vm.box = "centos/7"
    mgt.vm.hostname = "mgt"
    mgt.vm.synced_folder "D:\\", "/vagrant", type: "nfs" 
   
	#    mgt.vm.synced_folder "C:\\Users\\br1212937\\Documents\\MobaXterm\\home\\aws_keys", "/home/vagrant/keys", type: "nfs", owner: "vagrant", group: "vagrant", mount_options: ["dmode=644,fmode=600"]
	mgt.vm.network "forwarded_port", guest: 22, host: 2222, id: 'ssh', auto_correct: false
    mgt.vm.network "private_network", type: "static", ip: "192.168.10.20"
    mgt.vm.provision "shell", path: "./scripts/common.sh"
	mgt.vm.provision "shell", path: "./scripts/mgt.sh"
	mgt.vm.provision "shell", path: "./scripts/awscli.sh"
  end

  config.vm.define "docker" do |docker|
    docker.vm.provider  "virtualbox" do |vb|
      vb.memory = 2048
      vb.cpus = 2
    end
    docker.ssh.username = "vagrant"
    docker.landrush.enabled = true
	docker.vm.box = "centos/7"
    docker.vm.hostname = "docker"
    docker.vm.network :forwarded_port, guest: 22, host: 2223, id: 'ssh', auto_correct: true
    docker.vm.network "private_network", type: "static", ip: "192.168.10.21"
	docker.vm.synced_folder ".", "/vagrant", disabled: true
	docker.vm.provision "shell", path: "./scripts/common.sh"	
	docker.vm.provision "shell", path: "./scripts/docker.sh"
  end
  
  config.vm.define "freerdp" do |freerdp|
    freerdp.vm.provider  "virtualbox" do |vb|
      vb.memory = 1024
      vb.cpus = 2
    end
    freerdp.ssh.username = "vagrant"
	#freerdp.landrush.enabled = true
    freerdp.vm.box = "ubuntu/trusty64"
    freerdp.vm.hostname = "freerdp"
    freerdp.vm.network "private_network", type: "static", ip: "192.168.10.22"
    freerdp.vm.network :forwarded_port, guest: 22, host: 2222, id: 'ssh', auto_correct: true
	freerdp.vm.synced_folder ".", "/vagrant", disabled: true
	#freerdp.vm.provision "shell", path: "./scripts/common.sh"
    
  end  
  
  config.vm.define "rabbitmq02" do |rabbitmq02|
#    proxy.vm.provider  "virtualbox" do |vb|
#      vb.memory = 1024
#      vb.cpus = 2
#    end
    rabbitmq02.ssh.username = "vagrant"
	rabbitmq02.landrush.enabled = true
    rabbitmq02.vm.box = "centos/7"
    rabbitmq02.vm.hostname = "rabbitmq02"
    rabbitmq02.vm.network "private_network", type: "static", ip: "192.168.10.23"
    rabbitmq02.vm.network :forwarded_port, guest: 22, host: 2222, id: 'ssh', auto_correct: true
	rabbitmq02.vm.synced_folder ".", "/vagrant", disabled: true
	rabbitmq02.vm.provision "shell", path: "./scripts/common.sh"
  end  
  
  config.vm.define "nginx" do |nginx|
    nginx.vm.provider  "virtualbox" do |vb|
#      vb.memory = 1024
      vb.cpus = 2
    end
    nginx.ssh.username = "vagrant"
    nginx.vm.box = "centos/7"
	#nginx.landrush.enabled = true
    nginx.vm.hostname = "nginx"
    nginx.vm.network "private_network", type: "static", ip: "192.168.10.24"
    nginx.vm.network :forwarded_port, guest: 22, host: 2222, id: 'ssh', auto_correct: true
	nginx.vm.synced_folder ".", "/vagrant", disabled: true
	nginx.vm.provision "shell", path: "./scripts/common.sh"
    
  end

  config.vm.define "winmgt" do |winmgt|
    winmgt.vm.provider  "virtualbox" do |vb|
      vb.memory = 1024
      vb.cpus = 2
	  vb.customize ["modifyvm", :id, "--vram", "12"]
    end
    winmgt.ssh.username = "vagrant"
    winmgt.vm.box = "win2012"
	#winmgt.vm.provision "windows-sysprep"
	#winmgt.landrush.enabled = true
    winmgt.vm.hostname = "winmgt"
    winmgt.vm.network "private_network", type: "static", ip: "192.168.10.203"
    winmgt.vm.network :forwarded_port, guest: 3389, host: 3390, id: 'ssh', auto_correct: true
	winmgt.vm.synced_folder ".", "/vagrant", disabled: true
	#winmgt.vm.network :forwarded_port, guest: 22, host: 2222, id: 'ssh', auto_correct: true
	#winmgt.vm.provision "shell", path: "./scripts/win_common.bat"
 	#winmgt.vm.provision "shell", inline: "sudo yum install -y httpd"
	
  end 
  
  config.vm.define "web2" do |web2|
    web2.vm.provider  "virtualbox" do |vb|
      vb.memory = 1024
      vb.cpus = 2
    end
    web2.ssh.username = "vagrant"
    web2.vm.box = "opentable/win-2012r2-standard-amd64-nocm"
	#web2.vm.provision "windows-sysprep"
	#web2.landrush.enabled = true
    web2.vm.hostname = "web2"
    web2.vm.network "private_network", type: "static", ip: "192.168.10.204"
    web2.vm.network :forwarded_port, guest: 3389, host: 3390, id: 'ssh', auto_correct: true
	web2.vm.synced_folder ".", "/vagrant", disabled: true
	#web2.vm.network :forwarded_port, guest: 22, host: 2222, id: 'ssh', auto_correct: true
	#web2.vm.provision "shell", path: "./scripts/win_common.bat"
 	#web2.vm.provision "shell", inline: "sudo yum install -y httpd"
	
  end   
  
  config.vm.define "web3" do |web3|
    web3.vm.provider  "virtualbox" do |vb|
      vb.memory = 1024
      vb.cpus = 2
    end
    web3.ssh.username = "vagrant"
    web3.vm.box = "therealslimpagey/Windows_Server_2003_Enterprise_R2_puppet"
	#web3.vm.provision "windows-sysprep"
	#web3.landrush.enabled = true
    web3.vm.hostname = "web3"
    web3.vm.network "private_network", type: "static", ip: "192.168.10.205"
    web3.vm.network :forwarded_port, guest: 3389, host: 3390, id: 'ssh', auto_correct: true
	web3.vm.synced_folder ".", "/vagrant", disabled: true
	#web3.vm.network :forwarded_port, guest: 22, host: 2222, id: 'ssh', auto_correct: true
	#web3.vm.provision "shell", path: "./scripts/win_common.bat"
 	#web3.vm.provision "shell", inline: "sudo yum install -y httpd"
	
  end   
  
  config.vm.define "dc2" do |dc2|
    dc2.vm.provider  "virtualbox" do |vb|
      vb.memory = 1024
      vb.cpus = 2
    end
    dc2.ssh.username = "vagrant"
    dc2.vm.box = "jacqinthebox/windowsserver2016core"
	#dc2.landrush.enabled = true
    dc2.vm.hostname = "dc12"
	#dc2.vm.provision "windows-sysprep"
    dc2.vm.network "private_network", type: "static", ip: "192.168.10.201"
    dc2.vm.network :forwarded_port, guest: 3389, host: 3390, id: 'ssh', auto_correct: true
	dc2.vm.synced_folder ".", "/vagrant", disabled: true
	#dc2.vm.network :forwarded_port, guest: 22, host: 2222, id: 'ssh', auto_correct: true
	#dc2.vm.provision "shell", path: "./scripts/win_common.bat"
 	#dc2.vm.provision "shell", inline: "sudo yum install -y httpd"
	
  end   
  
  config.vm.define "dc1" do |dc1|
    dc1.vm.box = "opentable/win-2012r2-standard-amd64-nocm"
	dc1.vm.provider  "virtualbox" do |vb|
      vb.memory = 1024
      vb.cpus = 2
    end
    dc1.ssh.username = "vagrant"
	dc1.vm.provision "windows-sysprep"
    #dc1.vm.box = "centos/7"
	#dc1.landrush.enabled = true
    dc1.vm.hostname = "dc1"
    dc1.vm.network "private_network", type: "static", ip: "192.168.10.202"
    dc1.vm.network :forwarded_port, guest: 3389, host: 3390, id: 'ssh', auto_correct: true
	#dc1.vm.network :forwarded_port, guest: 22, host: 2222, id: 'ssh', auto_correct: true
	dc1.vm.synced_folder ".", "/vagrant", disabled: true
	#dc1.vm.provision "shell", path: "./scripts/common.sh"
	#dc1.vm.provision "shell", inline: "sudo yum install -y httpd"	
    
  end  

end
