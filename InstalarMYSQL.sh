sudo rpm -Uvh https://repo.mysql.com/mysql80-community-release-el7-3.noarch.rpm
sudo sed -i 's/enabled=1/enabled=0/' /etc/yum.repos.d/mysql-community.repo
sudo rpm --import https://repo.mysql.com/RPM-GPG-KEY-mysql-2022
sudo yum --enablerepo=mysql80-community install mysql-community-server
sudo mysql -V
sudo systemctl start mysqld
sudo systemctl enable mysqld
sudo echo skip-grant-tables >> /etc/my.cnf
sudo systemctl restart mysqld
sudo mysql -u root -proot -e "FLUSH PRIVILEGES; UNINSTALL COMPONENT 'file://component_validate_password'; ALTER USER root@localhost IDENTIFIED BY 'root';"
sudo sed -i '/skip-grant-tables/d' '/etc/my.cnf'
sudo systemctl restart mysqld
