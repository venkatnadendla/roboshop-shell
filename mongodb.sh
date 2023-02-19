cp configs/mongodb.repo /etc/yum.repos.d/mongo.repo
yum install mongodb-org -y
systemctl enable mongod
systemctl start mongod
## update the mongod.conf file 127.0.0.1 wit 0.0.0.0
