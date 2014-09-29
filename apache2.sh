#!/bin/bash
chef-client -z -o apache2,apache2::mod_php5,apache2::mod_ssl,apache2::mod_rewrite,apache2::mod_expires,apache2::mod_deflate,apache2::mod_status,apache2::mod_headers
