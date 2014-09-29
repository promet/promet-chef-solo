#!/bin/bash
chef-client -z -o apt,logrotate,openssh,vim,mlocate,tmux,git,cron,rsyslog,ntp,chef_gem,yum,yum-epel,drupal::drush
