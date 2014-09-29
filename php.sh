#!/bin/bash
chef-client -z -o php,composer,php::module_mysql,php::module_gd,php::module_memcache,php::module_curl,promet_php::module_mcrypt,promet_php::apache2,promet_php::module_apc
