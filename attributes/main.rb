# http://man7.org/linux/man-pages/man5/yum.conf.5.html

default['yum']['main']['cachedir'] = '/var/cache/yum/$basearch/$releasever'
default['yum']['main']['distroverpkg'] = case node['platform']
                                         when 'amazon'
                                           'system-release'
                                         when 'scientific'
                                           'sl-release'
                                         when 'redhat'
                                           nil
                                         when 'oracle'
                                           'oraclelinux-release'
                                         else
                                           "#{node['platform']}-release"
                                         end
default['yum']['main']['releasever'] = 'latest' if platform?('amazon')
default['yum']['main']['alwaysprompt'] = nil # [true, false]
default['yum']['main']['assumeyes'] = nil # [true, false]
default['yum']['main']['bandwidth'] = nil # /^\d+$/
default['yum']['main']['best'] = nil # [true, false]
default['yum']['main']['bugtracker_url'] = nil
default['yum']['main']['clean_requirements_on_remove'] = nil # [true, false]
default['yum']['main']['color'] = nil # %w{ always never }
default['yum']['main']['color_list_available_downgrade'] = nil
default['yum']['main']['color_list_available_install'] = nil
default['yum']['main']['color_list_available_reinstall'] = nil
default['yum']['main']['color_list_available_upgrade'] = nil
default['yum']['main']['color_list_installed_extra'] = nil
default['yum']['main']['color_list_installed_newer'] = nil
default['yum']['main']['color_list_installed_older'] = nil
default['yum']['main']['color_list_installed_reinstall'] = nil
default['yum']['main']['color_search_match'] = nil
default['yum']['main']['color_update_installed'] = nil
default['yum']['main']['color_update_local'] = nil
default['yum']['main']['color_update_remote'] = nil
default['yum']['main']['commands'] = nil
default['yum']['main']['deltarpm'] = nil # [true, false]
default['yum']['main']['debuglevel'] = nil # /^\d+$/
default['yum']['main']['diskspacecheck'] = nil # [true, false]
default['yum']['main']['enable_group_conditionals'] = nil # [true, false]
default['yum']['main']['errorlevel'] = nil # /^\d+$/
default['yum']['main']['exactarch'] = nil # [true, false]
default['yum']['main']['exclude'] = nil
default['yum']['main']['excludepkgs'] = nil
default['yum']['main']['gpgcheck'] = true # [true, false]
default['yum']['main']['group_package_types'] = nil
default['yum']['main']['groupremove_leaf_only'] = nil # [true, false]
default['yum']['main']['history_list_view'] = nil
default['yum']['main']['history_record'] = nil # [true, false]
default['yum']['main']['history_record_packages'] = nil
default['yum']['main']['http_caching'] = nil # %w{ packages all none }
default['yum']['main']['ip_resolve'] = nil # %w{ 4 6 }
default['yum']['main']['installonly_limit'] = nil # /\d+/, /keep/
default['yum']['main']['installonlypkgs'] = nil
default['yum']['main']['installroot'] = nil
default['yum']['main']['keepalive'] = nil # [true, false]
default['yum']['main']['keepcache'] = false # [true, false]
default['yum']['main']['kernelpkgnames'] = nil
default['yum']['main']['localpkg_gpgcheck'] = false # [true,# false]
default['yum']['main']['logfile'] = '/var/log/yum.log'
default['yum']['main']['max_retries'] = nil # /^\d+$/
default['yum']['main']['mdpolicy'] = nil # %w{ packages all none }
default['yum']['main']['metadata_expire'] = nil # /^\d+$/
default['yum']['main']['mirrorlist_expire'] = nil # /^\d+$/
default['yum']['main']['multilib_policy'] = nil # %w{ all best }
default['yum']['main']['obsoletes'] = nil # [true, false]
default['yum']['main']['overwrite_groups'] = nil # [true, false]
default['yum']['main']['password'] = nil
default['yum']['main']['path'] = '/etc/yum.conf'
default['yum']['main']['persistdir'] = nil
default['yum']['main']['pluginconfpath'] = nil
default['yum']['main']['pluginpath'] = nil
default['yum']['main']['plugins'] = nil # [true, false]
default['yum']['main']['protected_multilib'] = nil
default['yum']['main']['protected_packages'] = nil
default['yum']['main']['proxy'] = nil
default['yum']['main']['proxy_password'] = nil
default['yum']['main']['proxy_username'] = nil
default['yum']['main']['password'] = nil
default['yum']['main']['recent'] = nil # /^\d+$/
default['yum']['main']['repo_gpgcheck'] = nil # [true, false]
default['yum']['main']['reposdir'] = nil
default['yum']['main']['reset_nice'] = nil # [true, false]
default['yum']['main']['rpmverbosity'] = nil # %w{ info critical# emergency error warn debug }
default['yum']['main']['showdupesfromrepos'] = nil # [true, false]
default['yum']['main']['skip_broken'] = nil # [true, false]
default['yum']['main']['skip_if_unavailable'] = nil # [true, false]
default['yum']['main']['ssl_check_cert_permissions'] = nil # [true, false]
default['yum']['main']['sslcacert'] = nil
default['yum']['main']['sslclientcert'] = nil
default['yum']['main']['sslclientkey'] = nil
default['yum']['main']['sslverify'] = nil # [true, false]
default['yum']['main']['syslog_device'] = nil
default['yum']['main']['syslog_facility'] = nil
default['yum']['main']['syslog_ident'] = nil
default['yum']['main']['throttle'] = nil # [/\d+k/, /\d+M/, /\d+G/]
default['yum']['main']['timeout'] = nil # /\d+/
default['yum']['main']['tolerant'] = false
default['yum']['main']['tsflags'] = nil
default['yum']['main']['username'] = nil
