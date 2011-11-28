#! /usr/bin/ruby
require "lib/api.rb"

SCANPATH="/media/sda1/DCIM/100MEDIA" 
FILEPATH="/home/root/files"
PROJECTDIR="/home/root/dakia"

def scan_files
  eth = `sh #{PROJECTDIR}/scripts/internet.sh`
  if eth.to_i == 1 
    clear
    clear
    display("No Network")
    return false
  end

  sleep(1)
  count = `ls -l #{SCANPATH}/ | wc -l`
  if count.to_i == 0 
    clear
    clear
    display("Put doc to scan", false)
    newline
    display("Press Enter", false)
    return false 
  end                
	system("mkdir -p #{FILEPATH}")           
	system("rm -rf #{FILEPATH}/*.*")           
	system("cp #{SCANPATH}/*.JPG #{FILEPATH}/")
	count = `ls -l #{FILEPATH}/ | wc -l`
	loop = true
        failcount = 0
        while loop
	  clear
	  clear
  	  display "Page Count #{count}", false
	  newline
  	  display "Press Enter", false
	  user_input = input
	  if user_input.to_i == 0 
		system("rm -rf #{SCANPATH}/*.JPG")
		loop = false
		return true
=begin
          elsif user_input.to_i == 0
		system("rm -rf #{SCANPATH}/*.JPG")
		display "Page not saved"
		sleep(1)
		display "Send again. BYE!"
		loop = false
=end
	  else
	  	display "Wrong Input"
		sleep(1)
		failcount += 1
		return false if failcount >= 3
	  end
        end
end
