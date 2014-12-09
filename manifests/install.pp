# Class: bash::install
#
class bash::install {

  package { 'bash':
    ensure => $bash::package_ensure,
    name   => $bash::package_name,
  }

}