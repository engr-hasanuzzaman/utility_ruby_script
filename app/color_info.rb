# ================================================
# In this file we will declare color schema for our application
# like, to show info text set color cyan
# ================================================

require 'colorize'

class String
  def c_info
    light_cyan
  end

  def c_success
    green
  end

  def c_error
    red
  end

  def c_warning
    yellow
  end
end