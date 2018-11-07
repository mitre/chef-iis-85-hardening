
default['iis']['file_system_object_component'] = 'disabled'

default['iis']['tlsVersion'] = 'TLS 1.2'

default['iis']['URIEnableCache'] = 1
default['iis']['UriMaxUriBytes'] = 262144
default['iis']['UriScavengerPeriod'] = 120

default['iis']['logDirectory'] = '%SystemDrive%\inetpub\logs\LogFiles'

default['iis']['computerName'] = 'VAGRANT-IFT3JLA'

# HMACSHA256  HMACSHA384  HMACSHA512
default['iis']['validation'] = 'HMACSHA512'

default['iis']['sessionStateTimeout'] = '00:20:00'

default['iis']['disableFileSysObjDir'] = 'C:\Users\vagrant\Documents'
