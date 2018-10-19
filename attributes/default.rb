
default['iis']['file_system_object_component'] = 'disabled'

default['iis']['URIEnableCache'] = 0
default['iis']['UriMaxUriBytes'] = 0
default['iis']['UriScavengerPeriod'] = 0

default['iis']['logDirectory'] = '%SystemDrive%\inetpub\logs\LogFiles'

# HMACSHA256  HMACSHA384  HMACSHA512
default['iis']['Validation'] = 'HMACSHA512'
