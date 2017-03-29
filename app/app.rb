#!/usr/bin/env ruby

require 'colorize'
require	'readline'
require_relative 'color_info'
require_relative 'file_encrypt'
require_relative 'file_decrypt'
require_relative 'remove_files'
require_relative 'utility'
require_relative 'load_secrete'

class App
  #
  # 	List	of	commands
  #

  NAME = 'ASSISTANT'
  CMDS	=	%w[	help encryption ls exit decryption t_login kill3000 clear_s disk].sort
  include Utility

  #
  # attributes
  #
  attr_accessor :encryption_key

  #
  # instance methods
  #

  def initialize
    load_secrete_key
  end

  def run_command
    completion	=
      proc	do	|str|
        case
        when	Readline.line_buffer	=~	/help.*/i
          puts	"Available	commands:\n"	+	"#{CMDS.join("\t")}"
        when	Readline.line_buffer	=~	/ls.*/i
          puts	`ls`
        when Readline.line_buffer =~ /encryption/
          FileEncrypt.new.run
        when Readline.line_buffer =~ /decryption/
          FileDecrypt.new.run
        when Readline.line_buffer =~ /kill3000/
          `fuser -k -n tcp 3000`
        when Readline.line_buffer =~ /disk/
          puts "------------------- this is "
          `nohup baobab &`
        when Readline.line_buffer =~ /clear/
          `clear`
        when	Readline.line_buffer	=~	/exit.*/i
          exit_msg
          exit	0
        else
          CMDS.grep(	/^#{Regexp.escape(str)}/i	)	unless	str.nil?
        end
      end

    #	Set	completion	process
    Readline.completion_proc	=	completion

    #	Make	sure	to	add	a	space	after	completion
    Readline.completion_append_character	=	'	'

    while	line	=	Readline.readline('new task -> '.c_instruction,	true)
      puts	completion.call
      break	if	line	=~	/^quit.*/i	or	line	=~	/^exit.*/i
    end
  end

  def load_secrete_key
    root_path = File.expand_path("../", __dir__)
    # puts "****************88 root path is #{root_path}"
    path = "#{root_path}/config/secrete.yml"
    # puts "the path is *************** #{path}"
    @env = LoadSecrete.new(path)
  end
end
