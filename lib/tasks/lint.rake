require 'lint'
require 'rubocop/rake_task'

namespace :lint do
  desc 'Run SCSS quality checks'
  task :scss do
    if Lint.config['check_all_files']
      files = "app/assets/stylesheets"
    else
      files = `git ls-files -om --exclude-standard | grep "\\.scss"`
      files = files.gsub("\n", " ").presence
      unless files
        next # Alternative to "return" in rake
      end
    end

    config_file   = Lint.config['config_file']['scss']
    shell_command = "scss-lint --config #{config_file} #{files}"

    if Lint.config['fail_when_violations_found']
      unless system(shell_command)
        raise 'SCSS quality checks do not pass'
      end
    else
      system(shell_command)
    end
  end


  desc 'Run Coffeelint quality checks'
  task :coffeescript do
    config_file = Lint.config['config_file']['coffeescript']

    if Lint.config['check_all_files']
      files         = "app/assets/javascripts"
      shell_command = "coffeelint.rb -f #{config_file} -r #{files}"
    else
      files = `git ls-files -om --exclude-standard | grep "\\.coffee"`
      files = files.gsub("\n", " ").presence
      unless files
        next # Alternative to "return" in rake
      end
      shell_command = "coffeelint.rb -f #{config_file} #{files}"
    end

    if Lint.config['fail_when_violations_found']
      unless system(shell_command)
        raise 'CoffeeScript quality checks do not pass'
      end
    else
      system(shell_command)
    end
  end


  desc 'Run Ruby quality checks'
  RuboCop::RakeTask.new(:ruby) do |task|
    task.requires << 'rubocop-rspec'

    config_file  = Lint.config['config_file']['ruby']
    task.options = ['--config', config_file]

    if Lint.config['check_all_files']
      task.patterns   = ['{app,config,features,lib,spec}/**/*.{rb,rake}']
      task.formatters = ['progress']
    else
      files = `git ls-files -om --exclude-standard | grep "\\.rb\\|\\.rake"`
      files = files.split.presence || ['tmp']
      task.patterns = files
    end

    if Lint.config['fail_when_violations_found']
      task.fail_on_error = true
    end
  end
end

desc 'Run quality checks for SCSS, Ruby and CoffeeScript'
task :lint => ['lint:scss', 'lint:coffeescript', 'lint:ruby'] do
end