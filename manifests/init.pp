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
class bash-history {

  case $::osfamily {
    'RedHat': {
      case $::operatingsystemmajrelease {
        '6': {
          file{'/etc/profile.d/history.sh':
            ensure  => file,
            mode    => '0644',
            source  => 'puppet:///modules/bash-history/history.sh',
          }
        }
        default: {
          fail("operatingsystemmajrelease is <${::operatingsystemmajrelease}> and this module supports RedHat version 6.")
        }
      }
    }
    default: {
      fail("osfamily is <${::osfamily}> and this module supports RedHat.")
    }
  }

}
