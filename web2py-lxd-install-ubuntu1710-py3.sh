#!/bin/bash

# Web2Py WebServer Configuration using Apache2 and WSGI (Python3 Version)
# Script made for Ubuntu 17.10 LXD container
# Author: Eduardo Medeiros Silva
apt update
apt install apache2 libapache2-mod-wsgi-py3 unzip -y
cd /etc/apache2/conf-available
wget # rewrite-ssl.conf
cd /etc/apache2/sites-available
wget # web2py.conf
cd /srv
wget # web2py_src.zip
unzip web2py_src.zip
rm web2py_src.zip
cd /srv/web2py
sudo -u www-data python3 -c "from gluon.main import save_password; save_password('web2py',443)"
mv handlers/wsgihandler.py .
chmod -R www-data:www-data web2py
a2enmod wsgi rewrite
a2enconf rewrite-ssl
a2dissite 000-default
a2ensite web2py
systemctl restart apache2
