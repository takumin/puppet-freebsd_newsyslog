# == Class freebsd_newsyslog::params
#
# This class is meant to be called from freebsd_newsyslog.
# It sets variables according to platform.
#
class freebsd_newsyslog::params {
  case $::osfamily {
    'FreeBSD': {
      $system_dir = '/etc/newsyslog.conf.d'
      $site_dir  = '/usr/local/etc/newsyslog.conf.d'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
