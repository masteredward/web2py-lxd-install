Web2Py Installation Scripts for LXD containers
==============================================

This repository contains various installation scripts that can automate installation and deployement of web2py environments, using Apache HTTP Server and WSGI module inside LXD containers.

- First you need to create an LXD container. Examples:

.. code:: console
	
	$ lxc launch ubuntu:17.10 web2py
	or
	$ lxc launch images:centos/7/amd64 web2py
	or
	$ lxc launch images:debian/9/amd64 web2py
	or
	$ lxc launch images:fedora/27/amd64 web2py

- Access container using LXC:

.. code:: console
	
	$ lxc exec web2py -- /bin/bash

- Inside container, download your chosen distribution installation script. Ubuntu example:

.. code:: console
	
	# wget https://raw.githubusercontent.com/masteredward/web2py-lxd-install/master/web2py-lxd-install-ubuntu1604.sh

- Run the script:

.. code:: console
	
	# bash web2py-lxd-install-ubuntu1604.sh

- Use your favourite Web Browser to access your Web2Py environment using container IP address. Enjoy!

