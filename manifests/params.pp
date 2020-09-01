# This class is used to define default parameters for the ant module.
#
class ant::params {
  $srcdir          = '/usr/local/src'
  $version         = '1.10.8'
  $checksum        = undef
  if $checksum == undef {
    $checksum_verify = false
  } else {
    $checksum_verify = true
  }
  $proxy_server    = undef
  $proxy_type      = undef
}