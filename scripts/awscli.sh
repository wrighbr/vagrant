

su -c "pip install awscli --upgrade --user" vagrant

mkdir /home/vagrant/.aws
touch /home/vagrant/.aws/config
touch /home/vagrant/.aws/credentials
chown -R vagrant:vagrant /home/vagrant/.aws


tee /home/vagrant/.aws/config << END
[default]
region = 
END

tee /home/vagrant/.aws/credentials << END
[default]
aws_access_key_id = 
aws_secret_access_key = 
END

