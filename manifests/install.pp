class bash::install inherits bash {
  
  package { 'bash':
    ensure  => $package_ensure,
    name    => $package_name,
  }
  
}