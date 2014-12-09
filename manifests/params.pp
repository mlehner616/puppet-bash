# Class: bash::params
#
class bash::params {

  $aliases                  = undef
  $aliases_template         = 'bash/aliases.sh.erb'
  $history_config_template  = 'bash/history.sh.erb'
  $package_ensure           = 'present'
  $manage_skel              = false

  case $::osfamily {
    'Redhat': {
      $history_size         = '1000'
      $history_file_size    = '1000'
      $history_time_format  = undef
      $profile_dir          = '/etc'
      $profile_file         = "${profile_dir}/profile"
      $profiled_dir         = "${profile_dir}/profile.d"
      $history_config       = "${profiled_dir}/history.sh"
      $aliases_config       = "${profiled_dir}/aliases.sh"
      $package_name         = [ 'bash' ]
    }
    default: {
      fail("The ${module_name} module is not supported on an ${::osfamily} base\
d system.")
    }
  }
}