#!/bin/sh
#
#  Initial site into git repo.  Create gitignore and create branches
#  Run by regular user, like promet, with sudo
#  Params: site subdomain/domain

if [ -z $1 ]; then
   echo "ERROR: Please enter complete site subdomain/domain.  Example:  prometsource.prometdev.com"
   exit 0
fi

# Variables
SITENAME=$1
SCRIPT_DIR=/home/promet/hosting_scripts

# create post-receive hook file
cp -v  /home/promet/post-receive-hook.template /home/promet/${SITENAME}-post-receive
perl -pi -e "s/path_to_webroot/${SITENAME}/g" /home/promet/${SITENAME}-post-receive
chmod 755 /home/promet/${SITENAME}-post-receive

# create .gitignore file
cp -v ${SCRIPT_DIR}/includes/gitignore.template /var/www/sites/${SITENAME}/.gitignore

# initiate and setup to connect to repo repo
cd /var/www/sites/${SITENAME}
chown -R promet.www-data /var/www/sites/${SITENAME}
su promet -c "git init"
su promet -c "git remote add origin git@git.promethost.com:${SITENAME}"
su promet -c "git config branch.master.remote origin"
su promet -c "git config branch.master.merge refs/heads/master"
su promet -c "git config core.filemode false"
su promet -c "git add ."
su promet -c "git commit -am 'initialize repo'"
su promet -c "git push origin master"

# create standard branches
su promet -c "git branch staging"
su promet -c "git push origin -u staging"
su promet -c "git branch production"
su promet -c "git push origin -u production"
su promet -c "git branch development"
su promet -c "git push origin -u development"
su promet -c "git branch updates"
su promet -c "git push origin -u updates"
su promet -c "git branch promet"
su promet -c "git push origin -u promet"

# set devsite to promet branch
cd /var/www/sites/${SITENAME}
su promet -c "git checkout promet"

echo "DONE!"
