require_relative 'color_info'

module Utility
  def present?
    !self.nil? && self.empty
  end

  def terminal_size
    @terminal_size ||= `tput cols`.chomp.to_i
  end

  def print_separate_line(char = '#')
    puts ('=' * (terminal_size.to_i / 2)).c_warning
  end

  def instruction_msg(msg)
    msg(msg, color: 'c_instruction')
  end

  def msg(msg, options = {})
    color_info, t_side_width = options[:color] || 'c_info', options[:t_side_width] || 0

    puts "#{' ' * t_side_width} #{msg} #{' ' * t_side_width}".send(color_info)
  end

  def suc_msg(msg)
    msg(msg, color: 'c_success')
  end

  def welcome_msg(msg)
    width = (terminal_size - msg.size - 2) / 2

    msg(msg, t_side_width: width)
  end

  def exit_msg(msg)
    puts ' '
    welcome_msg(msg)
  end
  def error_msg(msg)
    msg(msg, color: 'c_error')
  end

  def log(msg)
    puts msg
  end
end