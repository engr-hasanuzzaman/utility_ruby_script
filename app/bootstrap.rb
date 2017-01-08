require 'colorize'
require	'readline'
require_relative 'color_info'
require_relative 'file_encrypt'

#	Prevent	Ctrl+C	for	exiting
trap('INT',	'SIG_IGN')

class Bootstrap
  #
  # 	List	of	commands
  #

  CMDS	=	[	'help',	'file encryption',	'ls',	'exit'	].sort

  #
  # attributes
  #
  attr_accessor :encryption_key

  #
  # instance methods
  #

  def initialize(encryption_key = nil)
    # @encryption_key = encryption_key
  end

  def run_command
    completion	=
        proc	do	|str|
          case
            when	Readline.line_buffer	=~	/help.*/i
              puts	"Available	commands:\n"	+	"#{CMDS.join("\t")}"
            when	Readline.line_buffer	=~	/rubyfu.*/i
              puts	"Rubyfu,	where	Ruby	goes	evil!"
            when	Readline.line_buffer	=~	/ls.*/i
              puts	`ls`
            when Readline.line_buffer =~ /file encryption/
              FileEncrypt.new.run
            when	Readline.line_buffer	=~	/exit.*/i
              puts	'Exiting..'
              exit	0
            else
              CMDS.grep(	/^#{Regexp.escape(str)}/i	)	unless	str.nil?
          end
        end

    #	Set	completion	process
    Readline.completion_proc	=	completion

    #	Make	sure	to	add	a	space	after	completion
    Readline.completion_append_character	=	'	'

    while	line	=	Readline.readline('new task -> ',	true)
      puts	completion.call
      break	if	line	=~	/^quit.*/i	or	line	=~	/^exit.*/i
    end
  end
end

#
# puts 'Please enter your encryption key to decrypt configuration file'.c_info
# encription_key = Readline.readline('-> ',	true)
#
# if encription_key.nil? || encription_key.size < 1
#   puts 'You does not provide any password.
#   Application will not work if encryption password needed'.c_info
# end

Bootstrap.new.run_command