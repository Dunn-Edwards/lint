namespace :lint do

  desc "Run SCSS quality checks"
  task :scss do
    exit(1) unless system("scss-lint app/assets/stylesheets --config #{config('scss-lint.yml')}")
  end

  def config(file)
    File.realdirpath("#{__FILE__}/../../../config/#{file}")
  end

end
