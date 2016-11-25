# baseurl alias 'url'
yum_repository 'test6' do
  description 'a test'
  url 'http://drop.the.baseurl.biz'
  action :create
end
