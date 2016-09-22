# case node['platform']
# when 'fedora'
#   yum_repository 'rpmfusion' do
#     mirrorlist 'http://mirrors.rpmfusion.org/mirrorlist?repo=free-fedora-$releasever&arch=$basearch'
#     enabled true
#     options(
#       'metadata_expire' => '7d'
#     )
#   end
# else
#   yum_repository 'rpmfusion' do
#     mirrorlist 'http://mirrors.rpmfusion.org/mirrorlist?repo=free-el-updates-released-$releasever&arch=$basearch'
#     enabled true
#     options(
#       'metadata_expire' => '7d'
#     )
#     action :create
#   end
# end


yum_repository 'epel' do
  mirrorlist "http://mirrors.fedoraproject.org/mirrorlist?repo=epel-#{node['platform_version'].to_i}&arch=$basearch"
  action :create
end

yum_repository 'rpmfusion' do
  action :delete
end
