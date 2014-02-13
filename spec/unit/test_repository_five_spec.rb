require 'spec_helper'

describe 'yum_test::test_repository_four' do
  let(:test_repository_four_run) do
    ChefSpec::Runner.new(
      :step_into => 'yum_repository'
      ).converge(described_recipe)
  end

  let(:test_repository_four_template) do
    test_repository_four_run.template('/etc/yum.repos.d/test4.repo')
  end

  context 'creating a yum_repository with :remove alias' do
    it 'removes yum_repository[test4]' do
      expect(test_repository_four_run).to remove_yum_repository('test4')
    end

    it 'deletes file[/etc/yum.repos.d/test4.repo]' do
      expect(test_repository_four_run).to delete_template('/etc/yum.repos.d/test4.repo')
    end

    it 'does not run execute[yum clean test4]' do
      expect(test_repository_four_run).to_not run_execute('yum clean test4')
    end

    it 'does not run ruby_block[yum-cache-reload-test4]' do
      expect(test_repository_four_run).to_not run_ruby_block('yum-cache-reload-test4')
    end

    it 'sends a :run to execute[yum clean test4]' do
      expect(test_repository_four_template).to notify('execute[yum clean test4]')
    end

    it 'sends a :create to ruby_block[yum-cache-reload-test4]' do
      expect(test_repository_four_template).to notify('ruby_block[yum-cache-reload-test4]')
    end

  end
end
