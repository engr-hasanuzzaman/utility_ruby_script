#!/usr/bin/env ruby

require_relative 'app'

#	Prevent	Ctrl+C	for	exiting
trap('INT',	'SIG_IGN')

# run application
App.new.run_command
