class bash::config inherits bash {
  
  file { $history_config:
    ensure  => file,
    owner   => 0,
    group   => 0,
    mode    => '0644',
    content => template($history_config_template),
  }
  
  file { $aliases_config:
    ensure  => file, 
    owner   => 0,
    group   => 0,
    mode    => '0644',
    content => template($aliases_template)
  }
}