#!/bin/sh
#
#  Install Drupal 7 site from drush.make file
#  Run by regular user, like promet, with sudo
#  Params: site subdomain/domain and database url

if [ -z $1 ]; then
   echo "ERROR: Please enter complete site subdomain/domain.  Example:  prometsource.prometdev.com"
   exit 0
fi
if [ -z $2 ]; then
   echo "ERROR: Please enter database url. Example: 'mysqli://db_user:db_pass@db_host/db_name'"
   exit 0
fi

# Variables
SITEPATH=$1
DATABASE_URL=$2
SCRIPT_DIR=/home/promet/hosting_scripts

#  Install D7 site based on provided make file
cd /var/www/sites/${SITEPATH}
drush -y make ${SCRIPT_DIR}/includes/drupal7.make
drush -y si --account-name=admin --account-pass=drupaladm1n --site-name=${SITEPATH} --db-url=${DATABASE_URL}
mkdir /var/www/sites/${SITEPATH}/sites/all/modules/custom
mkdir /var/www/sites/${SITEPATH}/sites/all/modules/features
drush -y up
drush -y updb
chown -R promet.www-data /var/www/sites/${SITEPATH}
chmod -R g+w /var/www/sites/${SITEPATH}/sites/default/files
drush -y -r /var/www/sites/${SITEPATH} cron
