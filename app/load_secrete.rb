#
# take absolute path off app.yml file
#

require 'yaml'
require_relative 'utility'

class LoadSecrete
  include Utility

  def initialize(file_name)
    @file_path = file_name
    parse_yml
  end

  def value(key)
    @values[key]
  end

  private

  def parse_yml
    unless File.exist?(@file_path)
      log('you have no file named config/secrete.yml')
      log('Please create app.yml on config/ folder that will contain your secrete key.')

      return false
    end

    @values = YAML.load_file(@file_path)
  end
end
