require 'rubocop/rake_task'

namespace :lint do

  desc "Run SCSS quality checks"
  task :scss do
    exit(1) unless system("scss-lint app/assets/stylesheets --config #{config('scss-lint.yml')}")
  end

  desc "Run Ruby quality checks"
  RuboCop::RakeTask.new(:ruby) do |task|
    task.patterns = ['{app,config,features,lib,spec}/**/*.{rb,rake}']
    task.formatters = ['progress']
    task.fail_on_error = true
    task.options = ['--config', config('rubocop.yml')]
  end

  def config(file)
    File.realdirpath("#{__FILE__}/../../../config/#{file}")
  end

end
