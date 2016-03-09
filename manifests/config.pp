#
class logwatch::config inherits logwatch {

  unless ($package_ensure == 'absent') {
    file { 'logwatch.conf':
      ensure  => file,
      path    => '/etc/logwatch/conf/logwatch.conf',
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => template('logwatch/logwatch.conf.erb'),
    }
  }

}
