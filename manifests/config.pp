# == Class freebsd_newsyslog::config
#
# This class is called from freebsd_newsyslog for service config.
#
class freebsd_newsyslog::config {
  file {[
    "$::freebsd_newsyslog::system_dir",
    "$::freebsd_newsyslog::site_dir",
  ]:
    ensure  => directory,
    owner   => 'root',
    group   => 'wheel',
    mode    => '0755',
  }
}
