#! /usr/bin/ruby
require "lib/api.rb"

SCANPATH="/media/sda1/DCIM/100MEDIA" 
FILEPATH="/home/root/files"
PROJECTDIR="/home/root/dakia"

def scan_files
  eth = `#{PROJECTDIR}/scripts/internet.sh`
  if eth.to_i == 1 
    clear
    clear
    display("No Network")
    return 0
  end


  sleep(2)
  count = `ls -l #{SCANPATH}/ | wc -l`
  if count.to_i == 0 
    clear
    clear
    display("Put doc to send", false)
    newline
    display("and Press Enter", false)
    return 0 
  end                
	system("mkdir -p #{FILEPATH}")           
	system("rm -rf #{FILEPATH}/*.*")           
	system("cp #{SCANPATH}/*.JPG #{FILEPATH}/")
	count = `ls -l #{FILEPATH}/ | wc -l`
	loop = true
        while loop
  	  display "Page Count #{count}"
          sleep(2)
  	  display "Press 1:YES 0:NO"
          sleep(1)
	  user_input = input
	  if user_input.to_i == 1
		display "Page Saved"
		system("rm -rf #{SCANPATH}/*.JPG")
		loop = false
          elsif user_input.to_i == 0
		system("rm -rf #{SCANPATH}/*.JPG")
		display "Page not saved"
		sleep(1)
		display "Send again. BYE!"
		loop = false
	  else
	  	display "Wrong Input"
		sleep(1)
	  end
        end
        return user_input.to_i
end
