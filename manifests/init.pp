# Class: bash_history
#
# This module manages bash_history
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
class bash_history {

  file{'/etc/profile.d/history.sh':
    ensure  => file,
    mode    => '0644',
    source  => 'puppet:///modules/bash_history/history.sh',    
  }
}
