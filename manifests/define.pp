define newsyslog (
  $logfile,
  $owner = 'root',
  $group = 'wheel',
  $mode  = '0644',
  $count = '7',
  $size  = '*',
  $when  = '@T00',
  $flags = '',
  $pid,
  $signal
) {

  include newsyslog

  file { "$site_dir/$title":
    ensure  => file,
    content => 'newsyslog/newsyslog.conf.erb',
    mode    => 0444,
    owner   => 'root',
    group   => 'wheel',
  }

}
