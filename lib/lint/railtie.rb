module Lint
  class Railtie < Rails::Railtie
    railtie_name :lint

    rake_tasks do
      load 'tasks/lint.rake'
    end
  end
end
