# create alias 'add'
yum_repository 'test3' do
  description 'a test'
  baseurl 'http://drop.the.baseurl.biz'
  action :add
end
