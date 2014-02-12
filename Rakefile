require 'rspec/core/rake_task'
require 'rubocop/rake_task'
require 'foodcritic'
require 'kitchen'

# Style tests. Rubocop and Foodcritic
namespace :style do
  desc 'Run Ruby style checks'
  Rubocop::RakeTask.new(:ruby)

  desc 'Run Chef style checks'
  FoodCritic::Rake::LintTask.new(:chef) do |t|
    t.options = {
      :fail_tags => ['any'],
      :tags => ['~FC005']
    }
  end
end

desc 'Run all style checks'
task style: ['style:chef', 'style:ruby']

# Rspec and ChefSpec
desc "Run ChefSpec examples"
RSpec::Core::RakeTask.new(:spec)

# Integration tests. Kitchen.ci
namespace :integration do
  desc 'Run Test Kitchen with Vagrant'
  task :vagrant do
    Kitchen.logger = Kitchen.default_file_logger
    Kitchen::Config.new.instances.each do |instance|
      instance.test(:always)
    end
  end
  
  desc 'Run Test Kitchen with cloud plugins'
  task :cloud do
    puts "DEBUG: TRAVIS: #{ENV['TRAVIS']}"
    puts "DEBUG: TRAVIS_PULL_REQUEST: #{ENV['TRAVIS_PULL_REQUEST']}"

    run_kitchen = true
    if ENV['TRAVIS'] == 'true' && ENV['TRAVIS_PULL_REQUEST'] != 'false'
      run_kitchen = false
    end
    puts "DEBUG: run_kitchen: #{run_kitchen}"
    
    if run_kitchen
      Kitchen.logger = Kitchen.default_file_logger
      @loader = Kitchen::Loader::YAML.new('./.kitchen.cloud.yml')
      config = Kitchen::Config.new( :loader => @loader)
      config.instances.each do |instance|
        instance.test(:always)      
      end      
    end
  end
end

desc 'Run all tests on Travis'
task travis: ['style', 'spec', 'integration:cloud']

# Default
task default: ['style', 'spec', 'integration:vagrant']
