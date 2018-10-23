#
# Cookbook:: .
# Recipe:: security_policy
#
# Copyright:: 2018, The Authors, All Rights Reserved.

################################# NOT WORKING #################################
# V-76767
# For some reason the following control is hanging
if node['iis']['file_system_object_component'] == 'disabled'
  powershell_script 'V-76767' do
    code <<-EOH
    regsvr32 scrrun.dll /u
    EOH
  end
end
################################# NOT WORKING #################################
