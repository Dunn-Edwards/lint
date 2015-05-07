require 'lint/version'

module Lint
  require 'lint/railtie' if defined?(Rails)
end
