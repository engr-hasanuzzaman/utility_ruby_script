require 'colorize'
require	'readline'
require_relative 'color_info'
require_relative 'utility'

class RemoveFiles
  def initialize(root_folder_path, ext_name)
    @root_path, @extention = root_folder_path, ext_name
    run
  end

  private

  def run
    unless Dir.exist?(@root_path)
      error_msg('Your input root directory is not valid')
      return false
    end

    Dir.glob("#{@root_path}/**/*.#{@extention}").each do |file|
      log(file)
    end
  end
end
