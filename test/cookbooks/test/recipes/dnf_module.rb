dnf_module 'nodejs:12'

package 'nodejs'

dnf_module 'ruby:2.7' do
  action :install
end

dnf_module 'mysql' do
  action :disable
end
