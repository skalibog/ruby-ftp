# frozen_string_literal: true

require 'net/ftp'
require 'json'
require 'byebug'
require 'dotenv'

Net::FTP.open(EMV['FTP_URL']) do |ftp|
  # Login on server
  ftp.login(ENV['LOGIN'], ENV['PASSWORD'])

  # Change dir
  ftp.chdir(ENV['PATH'])

  # Return current remote directory
  puts ftp.pwd

  # File list (ls -las)
  list = ftp.list
  puts list

  # Array files into dir or linux ls
  array = ftp.nlst

  # Download all files from dir
  array.each { |el| ftp.get(el) }

  # Close connect
  ftp.close
end
