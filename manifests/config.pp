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
  
  if $manage_skel == true {
    
    file {'/etc/skel/.bashrc_custom':
      ensure  => file,
      source  => 'puppet:///modules/bash/bashrc_custom',
    }
    
    file {'/etc/skel/.bash_aliases':
      ensure  => file,
      content => '# Put all your custom aliases here'
    }
  }
}