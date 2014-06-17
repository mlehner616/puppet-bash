#puppet-bash

####Table of Contents

1. [Overview](#overview)
2. [Limitations - OS compatibility, module dependencies, etc.](#limitations)
3. [Usage - Configuration options and functionality](#usage)

##Overview

Puppet module to manage various bash configuration settings.  
Set up as a parameterized class but intended to be used with hiera.  
_By Default_: This module **_increases_** history size to 1000. EL default is 500. This is the **_only_** change made without explicit definition. 

For now, this module manages the following:

* Global puppet/hiera managed aliases
* Global bash history, file size, buffer size, & timestamp
* Puts a puppet-independent custom alias template in the /etc/skel folder for new users
* Ensures OS standard permissions are enforced on the above managed files
* Also manages the package based on OS

##Limitations

####Requires Puppet v3 and facter >= 1.7.0 (precautionary, untested on earlier versions)

Compatible with the following platforms (PRs welcome)  

* EL 5  
* EL 6

##Usage
A value of ```<_os default_>``` will use the Module specified  
defaults based on OS. This is _usually_ the same as OS defaults. 


aliases
---
Hash of global aliases and their commands

* Default: undef
* Type: hash

#####Example

```
bash::aliases:
  vi: vim
  ls: ls -alh
  pat: puppet agent -t
```

aliases_config
----
Location of the aliases config file on filesystem. By default this file is put in the os profile.d or equivalent directory

* Default: <_os default_>
* Type: string

#####Example
    bash::aliases_config: /etc/profile.d/aliases.sh

aliases_template
---
The erb template to be used to generate the alias_config file

* Default: 'bash/aliases.sh.erb'
* Type: string

####Example
    bash::aliases_template: bash/aliases.sh.erb
    # will look for the template in <module_path>/bash/templates/aliases.sh.erb

history_config
----
Location of the history config file on filesystem. By default this file is put in the os profile.d or equivalent directory

* Default: <_os default_>
* Type: string

#####Example
    bash::aliases_config: /etc/profile.d/history.sh

history\_config_template
----
The erb template to be used to generate the history_config file

* Default: 'bash/history.sh.erb'
* Type: string

####Example
    bash::aliases_template: bash/history.sh.erb
    # will look for the template in <module_path>/bash/templates/history.sh.erb

history\_file_size
----
The HISTFILESIZE to be set globally.
Read more: [GNU Bash history reference](http://www.gnu.org/software/bash/manual/html_node/Bash-History-Facilities.html)

* Default: <_os default_>
* Type: string

####Example
    bash::history_file_size: 1000

history_size
----
This HISTSIZE to be set globally.
Read more: [GNU Bash history reference](http://www.gnu.org/software/bash/manual/html_node/Bash-History-Facilities.html)

* Default: <_os default_>
* Type: string

####Example
    bash::bash::history_size: 1000

history\_time_format
----
This is the time format to be set globally for bash history. You'll you want to ensure the string contains a trailing space or another delimiting character. Since this will also usually contain '%' you must quote. [HISTTIMEFORMAT].

Read more: [GNU Bash history reference](http://www.gnu.org/software/bash/manual/html_node/Bash-History-Facilities.html)  

* Default: undef
* Type: string

####Example
    bash::history_time_format: "%F %T "

manage_skel
----
This is specifies whether or not you want the module to configure the skel

* Default: false
* Type: boolean

####Example
    bash::manage: true

package_ensure
----
Defines how the bash package should be managed by puppet. Takes the same options as the puppet ```package``` resource

* Default: 'present'
* Type: string

package_name
----
Defines the package name. In most cases, you won't have to worry about this for supported operating systems.

* Default: <_os default_>
* Type: array

profile_dir
----
This is actually almost always '/etc'

* Default: <_os default_>
* Type: string

profile_file
----
This is the profile file, usually either profile or bashrc; sometimes both.

* Default: <_os default_>
* Type: string

profiled_dir
----
This defines where the profile.d or equivalent is located

* Default: <_os default_>
* Type: string
