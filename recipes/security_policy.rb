#
# Cookbook:: .
# Recipe:: security_policy
#
# Copyright:: 2018, The Authors, All Rights Reserved.

template "V-76767 Setup" do
  path "#{node['iis']['disableFileSysObjDir']}\\Disable-Scripting.FileSystemObject.ps1"
  source 'Disable-Scripting.FileSystemObject.ps1.erb'
  notifies :run, 'powershell_script[V-76767]', :immediately
end

powershell_script 'V-76767' do
    code ". #{node['iis']['disableFileSysObjDir']}\\Disable-Scripting.FileSystemObject.ps1"
end
