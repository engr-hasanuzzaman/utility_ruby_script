# ================================================
# In this file we will declare color schema for our application
# like, to show info text set color cyan
# ================================================

require 'colorize'

class String
  def c_info
    colorize(color: :blue, background: :white)
  end

  def c_success
    colorize(color: :green, background: :white)
  end

  def c_error
    colorize(color: :red, background: :white)
  end

  def c_warning
    colorize(color: :yellow, background: :white)
  end

  def c_file
    colorize(color: :white, background: :black)
  end

  def c_instruction
    colorize(color: :cyan, background: :black)
  end

  def c_msg
    colorize(color: :white, background: :cyan)
  end
end