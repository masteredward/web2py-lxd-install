#!/bin/bash

# Web2Py WebServer Configuration using Apache 2.4 and WSGI module (Python3 Version)
# Script made for Ubuntu 17.10 LXD container
# Author: Eduardo Medeiros Silva
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
