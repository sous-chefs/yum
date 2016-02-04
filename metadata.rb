name 'yum'
maintainer 'Chef Software, Inc.'
maintainer_email 'cookbooks@chef.io'
license 'Apache 2.0'
description 'Configures various yum components on Red Hat-like systems'
version '3.10.0'

%w(amazon centos fedora oracle redhat scientific).each do |os|
  supports os
end

source_url 'https://github.com/chef-cookbooks/yum' if respond_to?(:source_url)
issues_url 'https://github.com/chef-cookbooks/yum/issues' if respond_to?(:issues_url)
