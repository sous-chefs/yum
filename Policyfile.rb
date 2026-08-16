# frozen_string_literal: true

name 'yum'

run_list 'recipe[test::default]'

cookbook 'yum', path: '.'
cookbook 'yum-epel', git: 'https://github.com/sous-chefs/yum-epel.git', branch: 'main'
cookbook 'yum-remi-chef', git: 'https://github.com/sous-chefs/yum-remi-chef.git', branch: 'main'
cookbook 'test', path: './test/cookbooks/test'

named_run_list :default, 'recipe[test::default]'
named_run_list :dnf_module, 'recipe[test::dnf_module]'
