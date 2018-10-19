#
# Cookbook:: chef_iis_85_hardening
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

# include_recipe 'iis::default'


powershell_script 'V-76771' do
  code <<-EOH
  Install-WindowsFeature -Name Web-Url-Auth
  Set-WebConfigurationProperty -filter "system.webServer/security/authentication/anonymousAuthentication" -name enabled -value false -PSPath "MACHINE/WEBROOT/APPHOST"
  Set-WebConfigurationProperty -filter "system.webServer/security/authentication/basicAuthentication" -name enabled -value true -PSPath "MACHINE/WEBROOT/APPHOST"
  Set-WebConfigurationProperty -filter "system.webServer/security/authentication/basicAuthentication" -name defaultLogonDomain -value Administrator -PSPath "MACHINE/WEBROOT/APPHOST"
  EOH
end

powershell_script 'V-76769' do
  code <<-EOH
  Install-WindowsFeature -Name Web-ISAPI-Ext
  Set-WebConfigurationProperty -filter "system.webServer/security/isapiCgiRestriction" -name notListedCgisAllowed -value false -PSPath "MACHINE/WEBROOT/APPHOST"
  Set-WebConfigurationProperty -filter "system.webServer/security/isapiCgiRestriction" -name notListedIsapisAllowed -value false -PSPath "MACHINE/WEBROOT/APPHOST"
  EOH
end
