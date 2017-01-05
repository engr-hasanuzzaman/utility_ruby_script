#!/usr/bin/env ruby
require "date" 

DBS = %w( list the databases to back up )
USER = "" # Username with rights to all those databases, might be root 
PW = "" # Password for that username 

today_s = Date.today().to_s
yesterday_s = (Date.today()-(2)).to_s

DBS.each do |db|
  system "/usr/bin/mysqldump --user=#{USER} --password=#{PW} --add-drop-database --opt -icC #{db} > ~/dbs/#{today_s}-#{db}.sql" 
  if File.exist?("/path/to/backups/dbs/#{yesterday_s}-#{db}.sql")
    File.unlink("/path/to/backups/dbs/#{yesterday_s}-#{db}.sql")
  end
end
