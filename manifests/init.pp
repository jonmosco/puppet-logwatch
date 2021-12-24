# == Class: logwatch
#
# This class configures Logwatch
#
# Parameters
# $output - unformatted, stdout - defaults to 'unformatted'
# $format - html or text - defaults to 'text'
# $mail_to - Array of email addresses to send to
# $mail_from - email address for logwatch 'from' emails
# $range - Requires a regex op ^All$, ^Today$, or ^Yesterday$.
# $detail - Requires a regex of ^Low$, ^Med$, or ^$High'.
# $service - Array of services to watch, defaults to 'All'
# $package_ensure - ensure the package is installed or latest or present
# $package_name - the name of the pacakge to install, logwatch typically is sufficient
#
class logwatch (
  Array    $service        = $logwatch::params::service,
  Array    $mail_to        = $logwatch::params::mail_to,
  String   $output         = $logwatch::params::output,
  String   $format         = $logwatch::params::format,
  String   $mail_from      = $logwatch::params::mail_from,
  String   $package_ensure = $logwatch::params::package_ensure,
  String   $package_name   = $logwatch::params::package_name,
  Optional $ignore_conf    = $logwatch::params::ignore_conf,
  Variant[ String, Enum[ 'All', 'Today', 'Yesterday' ] ]
           $range          = $logwatch::params::range,
  Variant[ String, Enum[ 'Low', 'Med', 'High' ] ]
           $detail         = $logwatch::params::detail,
) inherits logwatch::params {

  anchor { 'logwatch::begin': }
  -> class { '::logwatch::install': }
  -> class { '::logwatch::config': }
  -> anchor { 'logwatch::end': }

}
