class bash::params {
  
  $history_config_template  = 'bash/history.sh.erb'
  $package_ensure           = 'present'
  
  case $::osfamily {
    'Redhat': {
      $history_size         = '1000'
      $history_file_size    = '1000'
		  $history_time_format  = '%F %T '
      $profile_dir          = '/etc'
      $profile_file         = "${profile_dir}/profile"
      $profiled_dir         = "${profile_dir}/profile.d"
      $history_config       = "${profiled_dir}/history.sh" 
      $package_name         = [ 'bash' ]
    }
    default: {
      fail("The ${module_name} module is not supported on an ${::osfamily} based system.")
    }
  }
}