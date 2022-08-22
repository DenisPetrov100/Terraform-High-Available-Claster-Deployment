#!/bin/bash
echo ">>>======================== START =========================>>>"
yum -y update
yum -y install httpd
ip=`curl http://169.254.169.254/latest/meta-data/local-ipv4`
updated_at=`date`
echo "Highly Available Demo APP<br> Version: 1.0.0 <br>IP: $ip<br>Uppdated at: $updated_at"  > /var/www/html/index.html
sudo chmod 775 /var/www/html/index.html
sudo service httpd start
sudo chkconfig httpd on
echo ">>>========================   END   =======================>>>" 