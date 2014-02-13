require 'spec_helper'

describe 'yum_test::test_repository_five' do
  let(:test_repository_five_run) do
    ChefSpec::Runner.new(
      :step_into => 'yum_repository'
      ).converge(described_recipe)
  end

  let(:test_repository_five_template) do
    test_repository_five_run.template('/etc/yum.repos.d/test5.repo')
  end

  context 'deletes a yum_repository' do
    it 'delete yum_repository[test5]' do
      expect(test_repository_five_run).to delete_yum_repository('test5')
    end

    it 'deletes file[/etc/yum.repos.d/test5.repo]' do
      expect(test_repository_five_run).to delete_template('/etc/yum.repos.d/test5.repo')
    end

    it 'does not run execute[yum clean test5]' do
      expect(test_repository_five_run).to_not run_execute('yum clean test5')
    end

    it 'does not run ruby_block[yum-cache-reload-test5]' do
      expect(test_repository_five_run).to_not run_ruby_block('yum-cache-reload-test5')
    end

    it 'sends a :run to execute[yum clean test5]' do
      expect(test_repository_five_template).to notify('execute[yum clean test5]')
    end

    it 'sends a :create to ruby_block[yum-cache-reload-test5]' do
      expect(test_repository_five_template).to notify('ruby_block[yum-cache-reload-test5]')
    end

  end
end
