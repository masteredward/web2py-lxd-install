#!/bin/bash

# Web2Py WebServer Configuration using Apache 2.4 and WSGI module (Python3 Version)
# Script made for Ubuntu 16.04+ LXD container
# Author: Eduardo Medeiros Silva
echo "Starting Web2Py Ubuntu 16.04+ Installation (Python3 Version)..."
echo ""
apt update
apt full-upgrade -y
apt autoremove -y
apt install apache2 libapache2-mod-wsgi-py3 unzip -y
cd /etc/apache2/conf-available
wget https://raw.githubusercontent.com/masteredward/web2py-lxd-install/master/ubuntu1710/rewrite-ssl.conf
cd /etc/apache2/sites-available
wget https://raw.githubusercontent.com/masteredward/web2py-lxd-install/master/ubuntu1710/web2py.conf
cd /srv
wget https://mdipierro.pythonanywhere.com/examples/static/web2py_src.zip
unzip web2py_src.zip
rm web2py_src.zip
cd /srv/web2py
mv handlers/wsgihandler.py .
chown -R www-data:www-data .
sudo -u www-data python3 -c "from gluon.main import save_password; save_password('web2py',443)"
cd ~
a2enmod wsgi rewrite ssl
a2enconf rewrite-ssl
a2dissite 000-default
a2ensite web2py
systemctl restart apache2
ip address show eth0
echo ""
echo "Finished. Now access your Web2Py environment using the IPv4/IPv6 address above with your favourite Web Browser."
echo "Admin password is web2py. Change it soon as possible!"
