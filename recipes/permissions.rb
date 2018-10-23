#
# Cookbook:: .
# Recipe:: permissions
#
# Copyright:: 2018, The Authors, All Rights Reserved.

################################# NOT WORKING #################################
# V-76749
file 'C:\Windows\System32\inetsrv\InetMgr.exe' do
  rights :read, 'ALL APPLICATION PACKAGES'
  rights :read, 'SYSTEM'
  rights :read, 'Users'
  rights :write, 'ALL APPLICATION PACKAGES'
  rights :write, 'SYSTEM'
  rights :write, 'Users'
  rights :full_control, "#{node['iis']['computerName']}/Administrators"
  rights :full_control, "TrustedInstaller"
end

# V-76745
directory 'C:\inetpub' do
  rights :full_control, 'System'
  rights :full_control, "#{node['iis']['computerName']}/Administrators"
  rights :full_control, 'TrustedInstaller'
  rights :read, 'ALL APPLICATION PACKAGES'
  rights :read, "#{node['iis']['computerName']}/Users"
  rights :write, 'ALL APPLICATION PACKAGES'
  rights :write, "#{node['iis']['computerName']}/Users"
end
################################# NOT WORKING #################################
