require_relative 'color_info'

module Utility
  def present?
    !self.nil? && self.empty
  end

  def terminal_size
    @terminal_size ||= `tput cols`.chomp.to_i
  end

  def print_separate_line(char = '-')
    puts ('=' * (terminal_size.to_i / 2)).c_warning
  end

  def instruction_msg(msg)
    msg(msg, color: 'c_instruction', t_side_width: 0)
  end

  def msg(msg, options = {})
    color_info, t_side_width = options[:color] || 'c_info', (options[:t_side_width] || (terminal_size - msg.size - 10) / 2)
    space_char = options[:space_char] || ' '
    puts "#{space_char * t_side_width} #{msg} #{space_char * t_side_width}".send(color_info)
  end

  def suc_msg(msg)
    msg(msg, color: 'c_success')
  end

  def welcome_msg(msg)
    msg(msg, space_char: '=')
  end

  def exit_msg(msg = nil)
    msg = msg || "now your are exiting #{self.class::NAME}, hope come back soon"
    msg('')
    msg(msg, space_char: '=')
  end

  def error_msg(msg)
    msg(msg, color: 'c_error')
  end

  def log(message)
    error_msg(message)
  end
end
