#
# Cookbook:: chef_iis_85_hardening
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

include_recipe 'iis::default'
include_recipe 'chef_iis_85_hardening::services_and_features'
include_recipe 'chef_iis_85_hardening::security_policy'
include_recipe 'chef_iis_85_hardening::registry_keys'
include_recipe 'chef_iis_85_hardening::permissions'
