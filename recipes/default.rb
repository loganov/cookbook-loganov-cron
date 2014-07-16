#
# Cookbook Name:: loganov-cron
# Recipe:: default
#
# Copyright 2014, Loganov Industries
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'cron'

cron_d 'chef-client' do
  minute 15
  command '/usr/bin/chef-client'
  user 'root'
end