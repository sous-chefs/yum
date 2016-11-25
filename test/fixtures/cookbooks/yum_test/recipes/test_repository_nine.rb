# https://github.com/chef-cookbooks/yum/issues/92

yum_repository 'test9' do
  source 'custom_template.erb'
  description 'a test'
  baseurl 'http://drop.the.baseurl.biz'
  enabled false
  action :create
end
