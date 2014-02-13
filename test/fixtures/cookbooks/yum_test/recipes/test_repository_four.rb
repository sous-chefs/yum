# delete alias 'remove'
yum_repository 'test4' do
  description 'an test'
  baseurl 'http://drop.the.baseurl.biz'
  action :remove
end
