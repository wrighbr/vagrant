sudo su

yum install -y git

curl -fsSL get.docker.com -o get-docker.sh
sh get-docker.sh
service docker start

curl -L https://github.com/docker/compose/releases/download/1.16.1/docker-compose-`uname -s`-`uname -m` > /bin/docker-compose
chmod a+x /bin/docker-compose