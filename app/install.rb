require 'colorize'
require	'readline'
require_relative 'color_info'
require_relative 'utility'

path = File.expand_path File.dirname(__FILE__)
name = Readline.readline('Enter your assistant name -> '.c_instruction,	true)
name ||= 'shefaly'

system " sudo chmod 777 #{path}/bootstrap.rb"
system "sudo ln -s #{path}/bootstrap.rb /usr/local/bin/#{name}"
