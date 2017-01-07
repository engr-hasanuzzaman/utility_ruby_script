# require ''
#
# class FileEncrypt
#   attr_accessor :source_file_name, :target_file_name
#
#   def initialize(source_file_name, target_file_name = nil)
#     @source_file_name = source_file_name
#     @target_file_name = target_file_name || "encrypt_#{@source_file_name}"
#   end
# end

require 'crypt/blowfish'
require 'colorize'

unless ARGV[0]
  puts 'Usage: ruby encrypt.rb <filename.ext>'.red
  puts 'Example: ruby encrypt.rb secret.stuff'.red
  exit
end
#take in the file name to encrypt as an argument
filename = ARGV[0].chomp
puts "You are trying to encrypt file #{filename}".yellow
c = "Encrypted_#{filename}"
if File.exists?(c)
  puts 'File already exists.'.blue
  exit
end
print 'Enter your encryption key (1-56 bytes): '.blue
kee = $stdin.gets.chomp
puts "Your entered key is #{kee}"
begin
  blowfish = Crypt::Blowfish.new(kee)
  blowfish.encrypt_file(filename.to_str, c)
  puts 'Encryption SUCCESS!'.green
rescue Exception => e
  puts "An error occurred during encryption: \n #{e}"
end