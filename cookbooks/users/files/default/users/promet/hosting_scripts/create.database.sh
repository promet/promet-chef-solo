#!/bin/sh
#
#  Create database
#  Run by regular user, like promet, with sudo
#  Params: SITENAME or database name

if [ -z $1 ]; then
   echo "ERROR: Please enter database name or sitename.  Limit it to 8 chars if possible.  Example: prometsource."
   exit 0
fi

# Variables
SITENAME=$1
TIMESTAMP=`date +%Y%m%d.%H%M%S`
SCRIPT_DIR=/home/promet/hosting_scripts

# Create database name/user/pass and add privileges
cp ${SCRIPT_DIR}/includes/database.template ${SCRIPT_DIR}/database_${SITENAME}.txt
perl -pi -e "s/SITENAME/${SITENAME}/g" ${SCRIPT_DIR}/database_${SITENAME}.txt
perl -pi -e "s/DBPASS/${TIMESTAMP}/g" ${SCRIPT_DIR}/database_${SITENAME}.txt
mysql < ${SCRIPT_DIR}/database_${SITENAME}.txt
cat ${SCRIPT_DIR}/database_${SITENAME}.txt
