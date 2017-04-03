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

  concat { 'ignore.conf':
    path  => '/etc/logwatch/conf/ignore.conf',
    owner => 'root',
    group => 'root',
    mode  => '0644',
  }

  concat::fragment { 'header':
    target  => 'ignore.conf',
    content => "###### REGULAR EXPRESSIONS IN THIS FILE WILL BE TRIMMED FROM REPORT OUTPUT #####\n",
    order   => '01',
  }
}
