#!/bin/sh
#
#  Create apache virtual host.
#  Run by regular user, like promet, with sudo
#  Params: sitename or subdomain and top-level domain

if [ -z $1 ]; then
   echo "ERROR: Please enter sub-domain or sitename name. Example: prometsource.  This will setup a site prometsource.domain.tld"
   exit 0
fi
if [ -z $2 ]; then
   echo "ERROR: Please enter top-level domain. Example: prometdev.com or prometstaging.com"
   exit 0
fi

# Variables
SITENAME=$1
DOMAIN_NAME=$2
SITEPATH=/var/www/sites/${SITENAME}.${DOMAIN_NAME}
SCRIPT_DIR=/home/promet/hosting_scripts

# Let's make sure our default site home dir "/var/www/sites" exists. Let's put our default .htpasswd file there as well.
if [ ! -d "/var/www/sites" ]; then
    mkdir /var/www/sites
    echo 'demo:tRDiHQAt94yRs' >> /var/www/sites/.htpasswd
fi

# create apache vhost from our template
cp -v ${SCRIPT_DIR}/includes/vhost.template /etc/apache2/sites-available/${SITENAME}.${DOMAIN_NAME}
perl -pi -e "s/SITENAME/${SITENAME}.${DOMAIN_NAME}/g" /etc/apache2/sites-available/${SITENAME}.${DOMAIN_NAME}
ln -s /etc/apache2/sites-available/${SITENAME}.${DOMAIN_NAME} /etc/apache2/sites-enabled/${SITENAME}.${DOMAIN_NAME}

#  Create site's home dir if it doesn't exists
if [ ! -d "${SITEPATH}" ]; then
    mkdir ${SITEPATH}
fi

# Restart apache
/etc/init.d/apache2 restart
