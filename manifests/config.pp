# Class: bash::config
#
class bash::config {

  File {
    ensure => file,
    owner  => 0,
    group  => 0,
    mode   => '0644',
  }

  file { $bash::history_config:
    content => template($bash::history_config_template),
  }

  file { $bash::aliases_config:
    content => template($bash::aliases_template)
  }

  if $bash::manage_skel == true {

    file {'/etc/skel/.bashrc_custom':
      source => 'puppet:///modules/bash/bashrc_custom',
    }

    file {'/etc/skel/.bash_aliases':
      content => '# Put all your custom aliases here'
    }
  }
}