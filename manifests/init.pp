# Class: bash
#
# This module manages bash
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
class bash (
  $history_config           = $bash::params::history_config,
  $history_config_template  = $bash::params::history_config_template,
  $history_file_size        = $bash::params::history_file_size,
  $history_size             = $bash::params::history_size,
  $history_time_format      = $bash::params::history_time_format,
  $package_ensure           = $bash::params::package_ensure,
  $package_name             = $bash::params::package_name,
  $profile_dir              = $bash::params::profile_dir,
  $profile_file             = $bash::params::profile_file,
  $profiled_dir             = $bash::params::profile_dir
) inherits bash::params {
  
  validate_absolute_path($history_config)
  validate_string($history_config_template)
  validate_string($history_file_size)
  validate_string($history_size)
  validate_string($history_time_format)
  validate_string($package_ensure)
  validate_array($package_name)
  validate_absolute_path($profile_dir)
  validate_absolute_path($profile_file)
  validate_absolute_path($profiled_dir)
  
  # Since Puppet 3.2 we can 'contain' subclasses to ensure classes won't float
  # off and do weird things. More information is available at:
  # https://puppetlabs.com/blog/class-containment-puppet
  contain ::bash::install
  contain ::bash::config

}
