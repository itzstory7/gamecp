#!/bin/bash

yum install httpd mariadb-server -y
service httpd start
/sbin/chkconfig --levels 235 mysqld on
service mariadb start

mysql_secure_installation

mysql -uroot -p$spass -e "CREATE DATABASE gcpstory; CREATE USER 'gcpstory'@localhost IDENTIFIED BY 'gcpstory22'; GRANT ALL PRIVILEGES ON gcpstory.* TO 'gcpstory'@localhost; use gcpstory;"


yum install php-mysql php-gd php-imap php-ldap php-mbstring php-odbc php-pear php-xml php-xmlrp -y
yum install php -y
yum search php -y
yum install php-mysql php-gd php-imap php-ldap php-mbstring php-odbc php-pear php-xml php-xmlrpc -y
yum install php-pecl-apc -y
yum install php-mysql php-gd php-imap php-ldap php-mbstring php-odbc php-pear php-xml php-xmlrpc -y
systemctl restart httpd


cd /tmp
wget https://downloads.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz
tar -zxvf ioncube_loaders_lin_x86*
cd ioncube/
php -i | grep extension_dir
extension_dir => /usr/lib64/php/modules => /usr/lib64/php/modules
cp /tmp/ioncube/ioncube_loader_lin_5.4.so /usr/lib64/php/modules
sudo yum install nano
echo "zend_extension = /usr/lib64/php/modules/ioncube_loader_lin_5.4.so" >> /etc/php.ini
systemctl restart httpd

cd /var/www/html
rm -rf index.html
wget http://download1644.mediafire.com/gfnpbw5hf0wg/q6ixl638pt6ct2s/webroot.zip
unzip webroot.zip
rm -rf webroot.zip
cd .. 
chmod -R 777 html



echo "Completed"
