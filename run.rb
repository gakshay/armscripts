#! /usr/bin/ruby
require 'app/user.rb'
require 'app/scan.rb'
require 'app/send.rb'

PATH="/home/root/files"

while true
scan = scan_files
if scan
  user = User.new
  response = user.login
    if response
      user = Send.new("#{user.mobile}", "#{user.password}", PATH)
      result = user.export
      if result
	system("sh scripts/export.sh > /dev/null &")
        display "Sending ."                                            
	sleep 1
        display "Sending . ."                                           
        sleep 1
        display "Sending . . ."  
        sleep 1
	clear
	clear
	display "Email sent", false
	newline
	display "Thanks", false
      end
    end 
end
sleep 5
end
clear
display "eDakia"
