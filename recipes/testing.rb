
# For some reason the following control is hanging
#
# if node['iis']['file_system_object_component'] == 'disabled'
#   powershell_script 'V-76767' do
#     code <<-EOH
#     regsvr32 scrrun.dll /u
#     EOH
#   end
# end

registry_key 'V-76761' do
  key 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1\Client'
  values [{
    name: 'Enabled',
    type: :dword,
    data: 1
  }]
  action :create
end
registry_key 'V-76761' do
  key 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2\Client'
  values [{
    name: 'Enabled',
    type: :dword,
    data: 1
  }]
  action :create
end

registry_key 'V-76759' do
  key 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1\Client'
  values [{
    name: 'DisabledByDefault',
    type: :dword,
    data: 0
  }]
end
registry_key 'V-76759' do
  key 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2\Client'
  values [{
    name: 'DisabledByDefault',
    type: :dword,
    data: 0
  }]
end
registry_key 'V-76759' do
  key 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Client'
  values [{
    name: 'DisabledByDefault',
    type: :dword,
    data: 1
  }]
end
registry_key 'V-76759' do
  key 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 2.0\Client'
  values [{
    name: 'DisabledByDefault',
    type: :dword,
    data: 1
  }]
end
registry_key 'V-76759' do
  key 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 3.0\Client'
  values [{
    name: 'DisabledByDefault',
    type: :dword,
    data: 1
  }]
end

powershell_script 'V-76757' do
  code <<-EOH
  Set-WebConfigurationProperty -filter "system.webServer/asp/session" -name keepSessionIdSecure -value true -PSPath "MACHINE/WEBROOT/APPHOST"
  EOH
end

registry_key 'V-76755' do
  key 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\HTTP\Parameters'
  values [{
    name: 'URIEnableCache',
    type: :dword,
    data: node['iis']['URIEnableCache']
  }]
end
registry_key 'V-76755' do
  key 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\HTTP\Parameters'
  values [{
    name: 'UriMaxUriBytes',
    type: :dword,
    data: node['iis']['UriMaxUriBytes']
  }]
end
registry_key 'V-76755' do
  key 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\HTTP\Parameters'
  values [{
    name: 'UriScavengerPeriod',
    type: :dword,
    data: node['iis']['UriScavengerPeriod']
  }]
end

powershell_script 'V-76753' do
  code <<-EOH
  Uninstall-WindowsFeature -Name Print-Services
  EOH
end

# V-76749
resource '%windir%\system32\inetsrv\InetMgr.exe' do
  rights :read, 'ALL APPLICATION PACKAGES'
  rights :read, 'SYSTEM'
  rights :read, 'Users'
  rights :write, 'ALL APPLICATION PACKAGES'
  rights :write, 'SYSTEM'
  rights :write, 'Users'
  rights :full_control, 'WIN-EFQ98MD6RFI/Administrator'
end

powershell_script 'V-76747' do
  code <<-EOH
  Set-WebConfigurationProperty -filter "system.ApplicationHost/log/centralW3CLogFile" -name directory -value #{node['iis']['logDirectory']} -PSPath "MACHINE/WEBROOT/APPHOST"
  Set-WebConfigurationProperty -filter "system.ApplicationHost/log/centralW3CLogFile" -name period -value Daily -PSPath "MACHINE/WEBROOT/APPHOST"
  EOH
end

# V-76745
resource 'C:\\inetpub' do
  rights :full_control, 'System'
  rights :full_control, 'WIN-EFQ98MD6RFI/Administrator'
  rights :full_control, 'TrustedInstaller'
  rights :read, 'ALL APPLICATION PACKAGES'
  rights :read, 'WIN-EFQ98MD6RFI/Users'
  rights :write, 'ALL APPLICATION PACKAGES'
  rights :write, 'WIN-EFQ98MD6RFI/Users'
end

powershell_script 'V-76737' do
  code <<-EOH
  Set-WebConfigurationProperty -filter "system.webServer/httpErrors" -name errorMode -value DetailedLocalOnly -PSPath "MACHINE/WEBROOT/APPHOST"
  EOH
end

powershell_script 'V-76733' do
  code <<-EOH
  Set-WebConfigurationProperty -filter "system.webServer/directoryBrowse" -name enabled -value False -PSPath "MACHINE/WEBROOT/APPHOST"
  EOH
end

powershell_script 'V-76731' do
  code <<-EOH
  Set-WebConfigurationProperty -filter "system.web/machineKey/*" -name decryption -value Auto -PSPath "MACHINE/WEBROOT/APPHOST"
  Set-WebConfigurationProperty -filter "system.web/machineKey/*" -name validation -value #{node['iis']['validation']} -PSPath "MACHINE/WEBROOT/APPHOST"
  EOH
end

# Need to rework this
powershell_script 'V-76727' do
  code <<-EOH
  Set-WebConfigurationProperty -filter "system.web/sessionState/*" -name cookieless -value UseCookies -PSPath "MACHINE/WEBROOT/APPHOST"
  Set-WebConfigurationProperty -filter "system.web/sessionState/*/timeout" -name Minutes -value 20 -PSPath "MACHINE/WEBROOT/APPHOST"
  EOH
end

powershell_script 'V-76725' do
  code <<-EOH
  Set-WebConfigurationProperty -filter "system.web/sessionState/*" -name cookieless -value UseCookies -PSPath "MACHINE/WEBROOT/APPHOST"
  EOH
end

powershell_script 'V-76713' do
  code <<-EOH
  Uninstall-WindowsFeature -Name Web-DAV-Publishing
  EOH
end
