# Class: bash
#
# This module manages bash
#
# Requires: see Modulefile
#
class bash (
  $aliases                  = $bash::params::aliases,
  $aliases_config           = $bash::params::aliases_config,
  $aliases_template         = $bash::params::aliases_template,
  $history_config           = $bash::params::history_config,
  $history_config_template  = $bash::params::history_config_template,
  $history_file_size        = $bash::params::history_file_size,
  $history_size             = $bash::params::history_size,
  $history_time_format      = $bash::params::history_time_format,
  $manage_skel              = $bash::params::manage_skel,
  $package_ensure           = $bash::params::package_ensure,
  $package_name             = $bash::params::package_name,
  $profile_dir              = $bash::params::profile_dir,
  $profile_file             = $bash::params::profile_file,
  $profiled_dir             = $bash::params::profiled_dir
) {

  include bash::params

#  validate_array($aliases)
  validate_absolute_path($aliases_config)
  validate_string($aliases_template)
  validate_absolute_path($history_config)
  validate_string($history_config_template)
  validate_string($history_time_format)
  validate_bool($manage_skel)
  validate_string($package_ensure)
  validate_array($package_name)
  validate_absolute_path($profile_dir)
  validate_absolute_path($profile_file)
  validate_absolute_path($profiled_dir)

#  # Since Puppet 3.2 we can 'contain' subclasses to ensure classes won't float
#  # off and do weird things. More information is available at:
#  # https://puppetlabs.com/blog/class-containment-puppet
  contain bash::install
  contain bash::config
}
