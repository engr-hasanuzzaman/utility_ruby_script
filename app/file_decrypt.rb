require 'crypt/blowfish'
require 'readline'
require_relative 'utility'
require_relative 'color_info'

include Utility

class FileDecrypt
  NAME = 'file decryption'

  attr_accessor :s_abs_path, :s_file_name, :s_dir, :t_file_name, :t_dir, :t_abs_path, :s_key

  def run
    welcome_msg("welcome to #{self.class::NAME}")
    take_source_file_name

    if valid_file?
      take_encryption_key
      if valid_key?
        perform
      else
        error_msg('your entered secrete key is not valid')
        exit_msg("now your are exiting #{self.class::NAME}, hope come back soon")
      end
    else
      error_msg("there is no file  #{s_abs_path}")
      help
      exit_msg("now your are exiting #{self.class::NAME}, hope come back soon")
    end
  end

  private

  def take_source_file_name
    instruction_msg 'Enter file absolute file path that you want to decrypt'
    path = Readline.readline('-> '.c_instruction, true)
    # log " entered path is #{path}"
    self.s_abs_path = File.expand_path(path)
    self.s_dir = s_abs_path.split('/')[0...-1].join('/')
    self.s_file_name = s_abs_path.split('/')[-1]
    # log "abs path is #{s_abs_path}"
    # log "source directory is #{s_dir}"

    self.t_abs_path = "#{s_dir}/decrypted_#{s_file_name.split('_')[-1]}"
  end

  def valid_file?
    File.file?(s_abs_path)
  end

  def take_target_file_name
    self.t_file_name =
        Readline.readline(instruction_msg('Enter your encrypted file name: '), true)
  end


  def take_encryption_key
    instruction_msg('Enter your decryption key that you use to encrypt: ')
    self.s_key = Readline.readline('-> '.c_instruction, true)
  end

  def valid_key?
    !(s_key.nil? || s_key.size < 1)
  end

  # provide help for encryption
  def help
    msg 'Usage: <filename.ext> that has to be decrypted (absolute path)'
    msg 'Example: ~/encrypted_text.txt'
    msg 'Next enter secrete key that you had used to encrypt your file'
  end

  def perform
    # log "t_abs_path is #{t_abs_path}"
    # log "s_abs_path is #{s_abs_path}"
    begin
      blowfish = Crypt::Blowfish.new(s_key)
      blowfish.decrypt_file(s_abs_path, t_abs_path)
      suc_msg('Decryption SUCCESS!')
    rescue Exception => e
      error_msg("An error occurred during decryption: \n #{e}")
    end
  end
end

