require 'spec_helper'

describe 'yum_test::test_repository_five' do
  let(:test_repository_five_run) do
    ChefSpec::SoloRunner.new(
      step_into: 'yum_repository'
    ).converge(described_recipe)
  end

  let(:test_repository_five_file) do
    test_repository_five_run.file('/etc/yum.repos.d/test5.repo')
  end

  before do
    stub_command("yum repolist all | grep -P '^test5([ \t]|$)'")
      .and_return(true)
  end

  context 'removes a yum_repository' do
    it 'deletes yum_repository[test5]' do
      expect(test_repository_five_run).to remove_yum_repository('test5')
    end

    it 'deletes file[/etc/yum.repos.d/test5.repo]' do
      expect(test_repository_five_run).to delete_file('/etc/yum.repos.d/test5.repo')
    end

    it 'runs execute[yum clean all test5]' do
      expect(test_repository_five_run).to run_execute('yum clean all test5')
    end

    it 'sends a :create to ruby_block[yum-cache-reload-test5]' do
      expect(test_repository_five_file).to notify('ruby_block[yum-cache-reload-test5]')
    end

    it 'does not run ruby_block[yum-cache-reload-test5]' do
      expect(test_repository_five_run).to_not run_ruby_block('yum-cache-reload-test5')
    end
  end
end
