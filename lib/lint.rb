require 'yaml'
require 'lint/version'

module Lint
  require 'lint/railtie' if defined?(Rails)


  def self.gem_root
    File.expand_path '../..', __FILE__
  end


  def self.config
    @@config ||= load_cofig
  end


  private

  def self.load_cofig
    if File.file? 'config/lint.yml'
      load_custom_config
    else
      load_default_config
    end
  end


  def self.load_custom_config
    YAML.load_file 'config/lint.yml'
  end


  def self.load_default_config
    default_config = File.join(gem_root, 'config/lint.yml')

    result                                = YAML.load_file(default_config)
    result['config_file']['scss']         = File.join gem_root, result['config_file']['scss']
    result['config_file']['ruby']         = File.join gem_root, result['config_file']['ruby']
    result['config_file']['coffeescript'] = File.join gem_root, result['config_file']['coffeescript']

    result
  end
end
