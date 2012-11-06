# This class is used to define default parameters for the ant module.
#
# ==Parameters
#
# [srcdir]  The directory where the distribution tar file will be downloaded
#            before being unpacked and installed.
# [version]  The Ant version.
class ant::params {
  $srcdir = '/usr/local/src'
  $version = '1.8.2'
}