#
# Cookbook:: .
# Recipe:: registry_keys
#
# Copyright:: 2018, The Authors, All Rights Reserved.

registry_key 'V-76761' do
  key "HKEY_LOCAL_MACHINE\\SYSTEM\\CurrentControlSet\\Control\\SecurityProviders\\SCHANNEL\\Protocols\\#{node['iis']['tlsVersion']}\\Client"
  values [{
    name: 'Enabled',
    type: :dword,
    data: 1
  }]
  recursive true
  action :create
end

registry_key 'V-76759' do
  key 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1\Client'
  values [{
    name: 'DisabledByDefault',
    type: :dword,
    data: 0
  }]
  recursive true
  only_if {
    registry_key_exists?('HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1\Client', :x86_64)
  }
end
registry_key 'V-76759' do
  key 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2\Client'
  values [{
    name: 'DisabledByDefault',
    type: :dword,
    data: 0
  }]
  recursive true
  only_if {
    registry_key_exists?('HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2\Client', :x86_64)
  }
end
registry_key 'V-76759' do
  key 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Client'
  values [{
    name: 'DisabledByDefault',
    type: :dword,
    data: 1
  }]
  recursive true
  only_if {
    registry_key_exists?('HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Client', :x86_64)
  }
end
registry_key 'V-76759' do
  key 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 2.0\Client'
  values [{
    name: 'DisabledByDefault',
    type: :dword,
    data: 1
  }]
  recursive true
  only_if {
    registry_key_exists?('HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 2.0\Client', :x86_64)
  }
end
registry_key 'V-76759' do
  key 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 3.0\Client'
  values [{
    name: 'DisabledByDefault',
    type: :dword,
    data: 1
  }]
  recursive true
  only_if {
    registry_key_exists?('HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 3.0\Client', :x86_64)
  }
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
