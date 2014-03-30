# Loads mkmf which is used to make makefiles for Ruby extensions
require 'mkmf'

# Load Libraries

LIBDIR      = RbConfig::CONFIG['libdir']
INCLUDEDIR  = RbConfig::CONFIG['includedir']

HEADER_DIRS = [
  # First search /opt/local for macports
  '/opt/local/include',

  # Then search /usr/local for people that installed from source
  '/usr/local/include',

  # Check the ruby install locations
  INCLUDEDIR,

  # Finally fall back to /usr
  '/usr/include',
]

LIB_DIRS = [
  # First search /opt/local for macports
  '/opt/local/lib',

  # Then search /usr/local for people that installed from source
  '/usr/local/lib',

  # Check the ruby install locations
  LIBDIR,

  # Finally fall back to /usr
  '/usr/lib',
]

unless find_header('bcm2835.h')
  abort 'bcm2835 is missing, for production you will need to install http://www.airspayce.com/mikem/bcm2835/'
end

unless have_library('bcm2835') && append_library($libs, 'bcm2835')
  abort "Can't Appended Library bcm2835! for production you will need to install http://www.airspayce.com/mikem/bcm2835/"
end

dir_config('bcm2835', HEADER_DIRS, LIB_DIRS)

$CFLAGS << ' -std=c99'

# Give it a name
#extension_name = 'dht_sensor'

# The destination
#dir_config(extension_name)

# Do the work
create_makefile("dht_sensor/dht_sensor")
