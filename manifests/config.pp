# == Class freebsd_newsyslog::config
#
# This class is called from freebsd_newsyslog for service config.
#
class freebsd_newsyslog::config {
  file {[
    "$system_dir",
    "$site_dir",
  ]:
    ensure  => directory,
    owner   => 'root',
    group   => 'wheel',
    mode    => '0755',
  }
}
