# == Class: freebsd_newsyslog
#
# Full description of class freebsd_newsyslog here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class freebsd_newsyslog (
  $system_dir = $::freebsd_newsyslog::params::system_dir,
  $site_dir   = $::freebsd_newsyslog::params::site_dir,
) inherits ::freebsd_newsyslog::params {

  include stdlib

  validate_absolute_path($system_dir)
  validate_absolute_path($site_dir)

  class { '::freebsd_newsyslog::config': } ~>
  Class['::freebsd_newsyslog']
}
